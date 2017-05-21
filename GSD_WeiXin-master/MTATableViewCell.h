//
//  MTATableViewCell.h
//  MTA
//
//  Created by origin on 2017/1/23.
//  Copyright © 2017年 360Buy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTATableViewCell : UITableViewCell
@property(nonatomic,strong)UIButton *rebutton;
@property(nonatomic,strong)UILabel *relabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
