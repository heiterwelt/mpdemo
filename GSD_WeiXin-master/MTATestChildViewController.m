//
//  MTATestChildViewController.m
//  MTA
//
//  Created by origin on 2017/3/15.
//  Copyright © 2017年 360Buy. All rights reserved.
//

#import "MTATestChildViewController.h"
#import "MTACLTableViewController.h"
#import "MTACRCollectionViewController.h"
@interface MTATestChildViewController ()
{
    MTACLTableViewController *c1;
    MTACRCollectionViewController *c2;
}
@end

@implementation MTATestChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
     c1 = [[MTACLTableViewController alloc] init];
    [self addChildViewController:c1];
    c1.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width/3, self.view.frame.size.height);
    c1.tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:c1.tableView];
    [c1 didMoveToParentViewController:self];

    
    

    c2= [[MTACRCollectionViewController alloc] init];
    [self addChildViewController:c2];
    c2.tableView.frame = CGRectMake( self.view.frame.size.width/3+50, 0, self.view.frame.size.width*2/3-50, self.view.frame.size.height);
    c2.tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:c1.tableView];
    
    c2.tableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:c2.tableView];

    [c2 didMoveToParentViewController:self];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(90, 100, 90, 40)];
    button.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(reloaddataOnclick) forControlEvents:UIControlEventTouchUpInside];

    
    // Do any additional setup after loading the view.
}

-(void)reloaddataOnclick{
    [c1.tableView reloadData];
    [c2.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
