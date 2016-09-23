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
@end

static CGFloat const AspectRatio = 1.183;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo];
//    [self test];
}

- (void)test{
    for (NSString *ivar in [UITableView getIvarNameList])
        NSLog(@"%@",ivar);

    UIView *wrapperView = [self.tableView valueForKey:@"_wrapperView"];
    NSLog(@"%@", NSStringFromCGRect(wrapperView.frame));
}

- (void)demo{
    self.tableView.backgroundColor = [UIColor darkGrayColor];
    
    IFScrollRefreshHeader *ifHeader = [IFScrollRefreshHeader headerWithFrame:self.view.bounds];
    
    NSMutableArray *imgNames = [NSMutableArray arrayWithCapacity:1];
    for(NSInteger index = 1; index < 7; index++){
        NSString *imgName = [NSString stringWithFormat:@"page%ld",index];
        [imgNames addObject:imgName];
    }
    ifHeader.imgNames = imgNames;
    ifHeader.backgroundColor = [UIColor redColor];
    self.tableView.if_headerHeight = self.view.if_w / AspectRatio;
    self.tableView.if_header = ifHeader;
    
//    UIView *tableHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.if_w, 200)];
//    tableHeader.backgroundColor = [UIColor blueColor];
//    self.tableView.tableHeaderView = tableHeader;
}

#pragma mark <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [UITableViewCell new];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行：我是打酱油的数据",indexPath.row];
    return cell;
    
}

#pragma mark <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

@end
