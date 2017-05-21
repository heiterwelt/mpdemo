//
//  fffffffViewController.m
//  GSD_WeiXin(wechat)
//
//  Created by 红鸟的起源 on 17/5/21.
//  Copyright © 2017年 GSD. All rights reserved.
//

#import "fffffffViewController.h"

@interface fffffffViewController ()

@end

@implementation fffffffViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buutongcccc) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
    
    
    -(void)buutongcccc{
        
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
