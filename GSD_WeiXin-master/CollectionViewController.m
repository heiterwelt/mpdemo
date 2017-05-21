//
//  CollectionViewController.m
//  MTA
//
//  Created by origin on 2017/1/17.
//  Copyright © 2017年 360Buy. All rights reserved.
//

#import "CollectionViewController.h"
#import "JDMTACollectionViewCell.h"
@interface CollectionViewController ()
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    
    
    self.collectionView.collectionViewLayout = layout;

    [self.collectionView registerClass:[JDMTACollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 20;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 200;
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JDMTACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    

    cell.backgroundColor = [UIColor yellowColor];
   
    
    
    [cell.button addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}

-(void)nextClick:(UIButton *)sender{
    CollectionViewController *vc = [[CollectionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.collectionView.backgroundColor = [self randomColor];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    
}
-(UIColor *)randomColor{
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;

    
    
  return   [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(255)/255.0];
  
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
