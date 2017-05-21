//
//  MTATableViewCell.m
//  MTA
//
//  Created by origin on 2017/1/23.
//  Copyright © 2017年 360Buy. All rights reserved.
//

#import "MTATableViewCell.h"

@implementation MTATableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.relabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/5, self.frame.size.height)];
        [self addSubview:self.relabel];
//        self.relabel.backgroundColor=[UIColor yellowColor];
        
        self.rebutton =  [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2+self.frame.size.width/5, 0, self.frame.size.width/5, self.frame.size.height)];
        [self addSubview:self.rebutton];
        
        
        UIView *button =  [[UIView alloc] initWithFrame:CGRectMake(20, 0, self.frame.size.width/5, self.frame.size.height)];
        [self.contentView addSubview:button];
        button.backgroundColor = [UIColor redColor];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nslogs)];
        [button addGestureRecognizer:gesture];
//        [button addTarget:self action:@selector(nslog) forControlEvents:UIControlEventTouchUpInside];
//        self.rebutton.backgroundColor = [UIColor redColor];
    }
    return self;
}
-(void)nslogs{
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
