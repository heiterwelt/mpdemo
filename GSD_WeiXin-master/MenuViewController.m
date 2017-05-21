//
//  MenuViewController.m
//  MTA
//
//  Created by origin on 2017/1/22.
//  Copyright © 2017年 360Buy. All rights reserved.
//

#import "MenuViewController.h"
@interface MenuViewController ()
{
    UITextField *tf ;
}
- (IBAction)stepper:(id)sender;
- (IBAction)switchClick:(id)sender;
- (IBAction)progresss:(id)sender;

- (IBAction)segment:(id)sender;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view2  = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height*2/3, self.view.frame.size.width, self.view.frame.size.height/3)];
    [self.view addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:view2.bounds];
    [view2 addSubview:view3];
    
    
    tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 20, 70, 30)];
    tf.backgroundColor = [UIColor purpleColor];
    [view3 addSubview:tf];
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(30, 20, 30, 10)];
//    [view3 addSubview:button];
//    
    view2.backgroundColor = [UIColor redColor];
    view3.backgroundColor = [UIColor blueColor];
//    button.backgroundColor = [UIColor yellowColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapview:)];
    [view3 addGestureRecognizer:tap];
    UIButton *addButtonR = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [addButtonR setImage:[UIImage imageNamed:@"ic_keyboard_arrow_left_white_2x.png"] forState:UIControlStateNormal];
    // [IAUtility scaleToSize:CGSizeMake(20, 20) contentid:addButtonR.imageView];
    
    addButtonR.tintColor = [UIColor blackColor];
    [addButtonR setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    addButtonR.titleLabel.font=[UIFont systemFontOfSize:13];
    
    
    //addButtonR.imageView.backgroundColor=[UIColor greenColor];
    //[addButtonR setImage:addImageR forState:UIControlStateNormal];
    addButtonR.backgroundColor = [UIColor purpleColor];
    [addButtonR setContentMode:UIViewContentModeRight];
    [addButtonR setFrame:CGRectMake(0, 0, 40,  40)];
    addButtonR.imageEdgeInsets = UIEdgeInsetsMake(8,-10,8,20);
    
    //    [addButtonR LZSetbuttonType:LZCategoryTypeLeft];
    
    UIBarButtonItem *barButtonItemR = [[UIBarButtonItem alloc] initWithCustomView:addButtonR];
    [self.navigationItem setLeftBarButtonItem:barButtonItemR];
    [addButtonR addTarget:self action:@selector(backToHomePage) forControlEvents:UIControlEventTouchUpInside];
            // Do any additional setup after loading the view.
}

-(void)backToHomePage{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [tf resignFirstResponder];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)tapview:(UITapGestureRecognizer *)tap{

    
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
- (IBAction)buttonOnclick:(id)sender {
}

- (IBAction)toCollectionView:(id)sender {
    CollectionViewController *vc = [[CollectionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)stepper:(id)sender {
}

- (IBAction)switchClick:(id)sender {
}

- (IBAction)progresss:(id)sender {
}

- (IBAction)segment:(id)sender {
    NSLog(@"sss");
}
@end
