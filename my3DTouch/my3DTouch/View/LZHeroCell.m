//
//  LZHeroCell.m
//  my3DTouch
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZHeroCell.h"
#import "LZHeroItem.h"

@interface LZHeroCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation LZHeroCell


- (void)setHeroItem:(LZHeroItem *)heroItem
{
    _heroItem = heroItem;
    self.imageV.image = heroItem.icon;
    self.nameLabel.text = heroItem.name;
    self.descLabel.text = heroItem.desc;
}


@end
