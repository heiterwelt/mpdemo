//
// Copyright (c) 2014 Mixpanel. All rights reserved.

#import "MPABTestDesignerConnection.h"
#import "MPABTestDesignerSnapshotRequestMessage.h"
#import "MPABTestDesignerSnapshotResponseMessage.h"
#import "MPApplicationStateSerializer.h"
#import "MPObjectIdentityProvider.h"
#import "MPObjectSerializerConfig.h"

NSString * const MPABTestDesignerSnapshotRequestMessageType = @"snapshot_request";

static NSString * const kSnapshotSerializerConfigKey = @"snapshot_class_descriptions";
static NSString * const kObjectIdentityProviderKey = @"object_identity_provider";

@implementation MPABTestDesignerSnapshotRequestMessage

+ (instancetype)message
{
    return [(MPABTestDesignerSnapshotRequestMessage *)[self alloc] initWithType:MPABTestDesignerSnapshotRequestMessageType];
}

- (MPObjectSerializerConfig *)configuration
{
    NSDictionary *config = [self payloadObjectForKey:@"config"];
    return config ? [[MPObjectSerializerConfig alloc] initWithDictionary:config] : nil;
}

- (NSOperation *)responseCommandWithConnection:(MPABTestDesignerConnection *)connection
{
    __block MPObjectSerializerConfig *serializerConfig = self.configuration;
    __block NSString *imageHash = [self payloadObjectForKey:@"image_hash"];

    __weak MPABTestDesignerConnection *weak_connection = connection;
    NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        __strong MPABTestDesignerConnection *conn = weak_connection;

        // Update the class descriptions in the connection session if provided as part of the message.
        if (serializerConfig) {
            [connection setSessionObject:serializerConfig forKey:kSnapshotSerializerConfigKey];
        } else if ([connection sessionObjectForKey:kSnapshotSerializerConfigKey]) {
            // Get the class descriptions from the connection session store.
            serializerConfig = [connection sessionObjectForKey:kSnapshotSerializerConfigKey];
        } else {
            // If neither place has a config, this is probably a stale message and we can't create a snapshot.
            return;
        }

        // Get the object identity provider from the connection's session store or create one if there is none already.
        MPObjectIdentityProvider *objectIdentityProvider = [connection sessionObjectForKey:kObjectIdentityProviderKey];
        if (objectIdentityProvider == nil) {
            objectIdentityProvider = [[MPObjectIdentityProvider alloc] init];
            [connection setSessionObject:objectIdentityProvider forKey:kObjectIdentityProviderKey];
        }

        MPApplicationStateSerializer *serializer = [[MPApplicationStateSerializer alloc] initWithApplication:[UIApplication sharedApplication]
                                                                                               configuration:serializerConfig
                                                                                      objectIdentityProvider:objectIdentityProvider];

        MPABTestDesignerSnapshotResponseMessage *snapshotMessage = [MPABTestDesignerSnapshotResponseMessage message];
        __block UIImage *screenshot = nil;
        __block NSDictionary *serializedObjects = nil;

        dispatch_sync(dispatch_get_main_queue(), ^{
            screenshot = [serializer screenshotImageForWindowAtIndex:0];
        });
        snapshotMessage.screenshot = screenshot;

        if ([imageHash isEqualToString:snapshotMessage.imageHash]) {
            serializedObjects = [connection sessionObjectForKey:@"snapshot_hierarchy"];
        } else {
            dispatch_sync(dispatch_get_main_queue(), ^{
                serializedObjects = [serializer objectHierarchyForWindowAtIndex:0];
            });
            [connection setSessionObject:serializedObjects forKey:@"snapshot_hierarchy"];
        }

        snapshotMessage.serializedObjects = serializedObjects;
        NSLog(@" snapshotMessage   :%@",snapshotMessage);
        [conn sendMessage:snapshotMessage];
    }];

    return operation;
}

@end
