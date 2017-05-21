//
//  ViewController.h
//  MTADemo
//
//  Created by guochaoyang on 16/3/9.
//  Copyright © 2016年 360Buy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewController.h"
#import "MenuViewController.h"
//@interface ViewController : BaseViewController

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollvew;
- (IBAction)firstButton:(UIButton *)sender;

- (IBAction)addEvent:(id)sender;
- (IBAction)wentWeb:(id)sender;
- (IBAction)clickEvent:(id)sender;
- (IBAction)performanceEvent:(id)sender;
- (IBAction)orderEvent:(id)sender;
- (IBAction)userDefineEvent:(id)sender;
- (IBAction)exceptionEvent:(id)sender;
- (IBAction)pushNext:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)collectionViewClick:(id)sender;

@end

