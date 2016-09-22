//
//  ViewController.m
//  IFScrollRefreshDemo
//
//  Created by SaiDicaprio. on 16/9/22.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "ViewController.h"
#import "IFScrollRefresh.h"

#import "IFScrollRefreshHeader.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo];
}

- (void)demo{
    UIView *header = [[UIView alloc]initWithFrame:self.view.bounds];
    self.tableView.if_header = header;
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
