//
//  LZDetailViewController.m
//  my3DTouch
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZDetailViewController.h"
#import "LZHeroItem.h"

@interface LZDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation LZDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"zhangli";
    self.imageV.image = self.heroItem.icon;
    self.nameLabel.text = self.heroItem.name;
    self.descLabel.text = self.heroItem.desc;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"zhangli" style:0 target:self action:@selector(click)];

}

- (void)click{
    NSLog(@"asdf");
}

// 设置控制器在弹窗时候,下面输出的数组
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    UIPreviewAction *action = [UIPreviewAction actionWithTitle:@"标题1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点击了我");
    }];
    
    return  @[action];
}

@end
