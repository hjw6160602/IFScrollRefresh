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



#import "IFCollectionViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 所有图片的名字 */
@property (copy, nonatomic) NSArray<NSString *> *imgNames;




@property (nonatomic, strong) IFCollectionViewController *collectionViewController;

@end

static CGFloat const ASPECT_RATIO = 1.183;

@implementation ViewController

#pragma mark - Lazy

- (IFCollectionViewController *)collectionViewController{
    if (!_collectionViewController) {
        _collectionViewController = [[IFCollectionViewController alloc]initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    }
    return _collectionViewController;
}

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
    self.tableView.if_header = [IFScrollRefreshHeader headerWithImageNames:self.imgNames AspectRatio:ASPECT_RATIO];
    
    //为tableView添加真正的tableHeaderView
    [self setupTableHeaderView];
    //临时的一个tableHeaderView;
//    [self setupTableHeader];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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

- (void)setupTableHeader {
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.if_w, self.view.if_w/ASPECT_RATIO)];
    UIView *view = self.collectionViewController.collectionView;
    [header addSubview:view];
    //利用VFL添加约束
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *dict = @{@"view": view};
    NSMutableArray *cons = [NSMutableArray arrayWithCapacity:1];
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:dict]];
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:dict]];
    [header addConstraints:cons];
    NSMutableArray *imgNames = [NSMutableArray arrayWithCapacity:1];
    for(NSInteger index = 1; index < 7; index++){
        NSString *imgName = [NSString stringWithFormat:@"page%ld",index];
        [imgNames addObject:imgName];
    }
    NSMutableArray *imgs = [NSMutableArray arrayWithCapacity:1];
    for (NSString *imgName in imgNames) {
        UIImage *img = [UIImage imageNamed:imgName];
        [imgs addObject:img];
    }
    self.collectionViewController.images = [imgs copy];
    self.tableView.tableHeaderView = header;
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
