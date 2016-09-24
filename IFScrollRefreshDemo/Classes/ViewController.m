//
//  ViewController.m
//  IFScrollRefreshDemo
//
//  Created by SaiDicaprio. on 16/9/22.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "ViewController.h"
#import "IFScrollRefresh.h"
#import "NSObject+IFExtension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 所有图片的名字 */
@property (copy, nonatomic) NSArray<NSString *> *imgNames;
@end

static CGFloat const AspectRatio = 1.183;

@implementation ViewController

#pragma mark - Lazy
- (NSArray<NSString *> *)imgNames{
    if (!_imgNames) {
        NSMutableArray *imgNames = [NSMutableArray arrayWithCapacity:1];
        for(NSInteger index = 1; index < 7; index++){
            NSString *imgName = [NSString stringWithFormat:@"page%ld",index];
            [imgNames addObject:imgName];
        }
        _imgNames = [imgNames copy];
    }
    return _imgNames;
}

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    //为tableView添加if_header
    self.tableView.if_header = [IFScrollRefreshHeader headerWithImageNames:self.imgNames Height:self.view.if_w / AspectRatio];
    //为tableView添加真正的tableHeaderView
    [self setupTableHeaderView];
}

- (void)tempDisplay{
    for (NSString *ivar in [UITableView getIvarNameList])
        NSLog(@"%@",ivar);
    UIView *wrapperView = [self.tableView valueForKey:@"_wrapperView"];
    NSLog(@"%@", NSStringFromCGRect(wrapperView.frame));
}

#pragma mark - Setup
- (void)setupTableHeaderView{
    self.tableView.backgroundColor = [UIColor grayColor];
    UIView *tableHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.if_w, 100)];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake((self.view.if_w - 210) * 0.5, 35, 210, 30)];
    title.numberOfLines = 0;
    title.text = @"我是打酱油的tableHeader";
    title.textAlignment = NSTextAlignmentCenter;
    [tableHeader addSubview:title];
    title.layer.borderColor = [UIColor blackColor].CGColor;
    title.layer.borderWidth = 2.0;
    tableHeader.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = tableHeader;
}

#pragma mark <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行：我是打酱油的数据",indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

@end
