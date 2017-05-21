//
//  ViewController.m
//  MTADemo
//
//  Created by guochaoyang on 16/3/9.
//  Copyright © 2016年 360Buy. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "MTATestChildViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIView *view2=[[UIView alloc] initWithFrame:CGRectMake(0, 500, 60, 50)];
//    view2.backgroundColor=[UIColor redColor];
//    [self.view addSubview:view2];
//    
//    UIView *view3=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 50)];
//    view3.backgroundColor=[UIColor redColor];
//    [view2 addSubview:view3];
//
//    
//    
//    UIView *view4=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 50)];
//    view4.backgroundColor=[UIColor redColor];
//    [view3 addSubview:view4];
//    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 50)];
//    button.backgroundColor=[UIColor blueColor];
//    [view4 addSubview:button];
//    [button addTarget:self action:@selector(fffffffffffffffses) forControlEvents:UIControlEventTouchUpInside];
//    self.webView.hidden = YES;
    
    self.scrollvew.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    self.scrollvew.backgroundColor = [UIColor yellowColor];
    
    self.webView.frame = CGRectMake(0, self.view.frame.size.height-200, self.view.frame.size.width, self.view.frame.size.height-70);
    

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.jd.com"]];

    [self.webView loadRequest:request];
    
    
    
    
    

}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"controller appear 1111111111111111111111111111");
    [super viewWillAppear:animated];

}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    NSLog(@"controller disappear 1111111111111111111111111111");

}
-(void)fffffffffffffffses{
    NSLog(@"111111111111111111");
}
- (IBAction)firstButton:(UIButton *)sender {
    NSLog(@"dfdfdfdf");
}

- (IBAction)addEvent:(id)sender {
//    pv.shopID = pageParam[@"shopId"] ? : @"";
//    pv.skuNumber = pageParam[@"sku"] ? : @"";
//    pv.orderID = pageParam[@"ord"] ? : @"";
}


- (IBAction)clickEvent:(id)sender {
    
    

}

- (IBAction)performanceEvent:(id)sender {
    
    
    MTATestChildViewController *vc=[[MTATestChildViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
//    [JDMTA_Interface jdmta_cdn_performance:1.9
//                                  PageName:NSStringFromClass(self.class)
//                                 pic_endts:3.0
//                                 PageParam:@"performance"
//                                   pic_url:@"www.baidu.com"
//                                  pic_size:@"1.6M"
//                                    cdn_ip:@"cdn"
//                                   ldns_ip:@"10.8.133.108"];
}

- (IBAction)orderEvent:(id)sender {
    
//    NSDictionary *oerderdic=@{
//                              @"sku_tag":@""
//                              };
//    NSDictionary *dic3=
//    @{
//      @"orderInfo":@"orderinfor",
//      @"factPrice":@"orderprice",
//      
//      };
//    NSMutableDictionary *dic =[NSMutableDictionary dictionary];
//    [dic addEntriesFromDictionary:dic3];
//    [dic addEntriesFromDictionary:oerderdic];
//    
//    
//    [JDMTA_Interface jdmta_event_tracking:dic];
}

- (IBAction)userDefineEvent:(id)sender {
    
//    JDMTAUserDefine * define = [JDMTAUserDefine new];
//    define.eid = @"eid";
//    define.ela = @"ela";
//    define.eli = @"eli";
//    define.lon = @"623672367";
//    define.lat = @"8787";
//    define.currentParameters = @"sdjksdjk";
//    define.shopID =@"ihh";
//    define.skuNumber = @"8923823";
//    define.ord = @"sdsd";
//    define.pageParameters = @"236767327";
//    [JDMTA recordWithModel:define parameters:@{
//                                            @"typ12" : @"sr",
//                                            }];
}

- (IBAction)exceptionEvent:(id)sender {
    
    
    CGRect rect = [((UIButton *)sender) convertRect:((UIButton *)sender).bounds toView:self.view];
    
    CGRect rect2 = [((UIButton *)sender) convertRect:((UIButton *)sender).bounds toView:self.scrollvew];

    CGRect rect3 = [((UIButton *)sender) convertRect:((UIButton *)sender).bounds toView:[[UIApplication sharedApplication].windows objectAtIndex:0]];
    
    
    

    
//    JDMTAException * exception = [JDMTAException new];
//    
//    exception.edc = @"edc";
//    exception.lon = @"112";
//    exception.lat = @"765";
//    exception.currentParameters  =@"shdhjsdhjsd";
//    exception.pageParameters = @"236767327";
//    [JDMTA recordWithModel:exception parameters:@{
//                                            @"typ12" : @"sr",
//                                            
//                                            }];
//
}

- (IBAction)pushNext:(id)sender {

    NextViewController * next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

- (IBAction)wentWeb:(id)sender {
//    WebViewController *web = [[WebViewController alloc] init];
//    [self.navigationController pushViewController:web animated:YES];
}

- (IBAction)collectionViewClick:(id)sender {

    MenuViewController *vc = [[MenuViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
