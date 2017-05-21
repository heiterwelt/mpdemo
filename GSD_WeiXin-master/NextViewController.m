//
//  NextViewController.m
//  MTA
//
//  Created by guochaoyang on 16/3/16.
//  Copyright © 2016年 360Buy. All rights reserved.
//

#import "NextViewController.h"
#import "MTATestTableView.h"
@interface NextViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    NSArray *_data;
}
@property (nonatomic,strong) UIButton * nextButton;
@property(nonatomic,strong)MTATestTableView *tableView;
@property(nonatomic,strong)MTATestTableView *tableView2;



@end

@implementation NextViewController



-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[MTATestTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2) style:UITableViewStylePlain];
    }
    return _tableView;
}

-(MTATestTableView *)tableView2{
    if (!_tableView2) {
        _tableView2 = [[MTATestTableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2) style:UITableViewStylePlain];
        _tableView2.backgroundColor = [UIColor redColor];
    }
    return _tableView2;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView2];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    

    _data = [UIFont familyNames];

    //    _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    _nextButton.backgroundColor = [UIColor greenColor];
    //    _nextButton.frame = CGRectMake(100, 100, 70, 35);
    //    [_nextButton addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:_nextButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"identifier";
    MTATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MTATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell.rebutton addTarget:self action:@selector(nestClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    if ([tableView isEqual:self.tableView]) {
        cell.textLabel.textColor = [UIColor redColor];

    }
    if (indexPath.section == 0) {
        cell.rebutton.backgroundColor = [UIColor purpleColor];

    }else{
        cell.rebutton.backgroundColor = [UIColor grayColor];

    }
    cell.textLabel.text = _data[indexPath.row];
    
    return cell;
}

-(void)nestClick:(id)sender{
    NextViewController *next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NextViewController *next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)nextPage:(UIButton *)sender
{
    NextViewController * next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    UITableView *tablview = (UITableView *)scrollView;
    NSLog(@"+++++++++++++++++++++++++%p\n%p\n",tablview,scrollView);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
