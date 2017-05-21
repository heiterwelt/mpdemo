//
//  JDMTACollectionViewCell.m
//  MTA
//
//  Created by origin on 2017/4/1.
//  Copyright © 2017年 360Buy. All rights reserved.
//

#import "JDMTACollectionViewCell.h"

@implementation JDMTACollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
        _button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 25, 20)];
        [self.contentView addSubview:_button];
    }
    return self;
}
@end
