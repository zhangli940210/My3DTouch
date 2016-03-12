//
//  LZViewController.m
//  my3DTouch
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZViewController.h"
#import "LZHeroCell.h"
#import "LZHeroItem.h"
#import "LZDetailViewController.h"

@interface LZViewController () <UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 数组*/
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LZViewController

#pragma mark - 懒加载数据
-(NSArray *)dataArray{
    
    if (_dataArray == nil) {
        NSString *path =   [[NSBundle mainBundle] pathForResource:@"hero.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            LZHeroItem *item = [LZHeroItem itemWithDict:dict];
            [tempArray addObject:item];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 刷新数据
    [self.tableView reloadData];
    //获取TableView的高度
    CGFloat tableH = self.tableView.bounds.size.height;
    
    // 获取所有可见的cell
    NSArray *allCell = [self.tableView visibleCells];
    
    // 将所有可见的cell隐藏
    for (UITableViewCell *cell in allCell) {
        cell.transform = CGAffineTransformMakeTranslation(0, tableH);
    }
    
    
    // 动画延时执行时长
    CGFloat delayTime = 0.1;
    // 遍历所有cell,顺序执行上移的动画
    for(int i = 0; i < allCell.count;i++){
        
        CGFloat delay = i * delayTime;
        UITableViewCell *cell = allCell[i];
        [UIView animateWithDuration:1 delay:delay options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:nil];
        
    }
  
}

#pragma -mark TableView数据源代理方法

// 返回多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// 每组返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CellID";
    LZHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 判断是否支持3DTouch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        // 注册Cell支持3DTouch,并设置代理
        [self registerForPreviewingWithDelegate:self sourceView:cell];

    }
    
    //取出当前行模型
    LZHeroItem *item = self.dataArray[indexPath.row];
    cell.heroItem = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZDetailViewController *detailVC = [[LZDetailViewController alloc] init];
    detailVC.heroItem = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma -mark UIViewControllerPreviewingDelegate
// 轻按,中按时调用
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    // 获取sourceView
    LZHeroCell *cell = (LZHeroCell *)[previewingContext sourceView];
    // 设置弹出的预览位置
    [previewingContext setSourceRect:cell.bounds];
    // 设置弹框的View
    LZDetailViewController *detailVC = [[LZDetailViewController alloc] init];
    detailVC.preferredContentSize = CGSizeMake(0,300);
    detailVC.heroItem = cell.heroItem;
    return detailVC;
}

// 弹框出现后, 继续重按时调用
// viewControllerToCommit:就是上面传入的XqDetailViewController的控制器
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}


@end
