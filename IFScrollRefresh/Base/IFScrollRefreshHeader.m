//
//  IFScrollRefreshHeader.m
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/22.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "UIView+IFExtension.h"
#import "IFScrollRefreshHeader.h"
#import "IFCollectionViewController.h"

@interface IFScrollRefreshHeader ()
@property (nonatomic, strong) IFCollectionViewController *collectionViewController;
@end

@implementation IFScrollRefreshHeader

+ (instancetype)headerWithFrame:(CGRect)frame{
    IFScrollRefreshHeader *header = [[IFScrollRefreshHeader alloc]initWithFrame:frame];
    return header;
}

#pragma mark - lazy
- (IFCollectionViewController *)collectionViewController{
    if (!_collectionViewController) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionViewController = [[IFCollectionViewController alloc]initWithCollectionViewLayout:layout];
    }
    return _collectionViewController;
}

#pragma mark - 覆盖父类的方法
- (void)placeSubviews
{
    [super placeSubviews];
//    for (UIView *view in self.scrollView.subviews) {
//        NSLog(@"%@",view);
//    }
    // 设置y值(当自己的高度发生改变了，肯定要重新调整Y值，所以放到placeSubviews方法中设置y值)
//    self.if_y = - self.if_h - self.ignoredScrollViewContentInsetTop;
}

#pragma mark - setter
- (void)setImgNames:(NSArray *)imgNames{
    _imgNames = [imgNames copy];
    NSMutableArray *imgs = [NSMutableArray arrayWithCapacity:1];
    for (NSString *imgName in imgNames) {
        UIImage *img = [UIImage imageNamed:imgName];
        [imgs addObject:img];
    }
    self.collectionViewController.images = imgs;
    UIView *view = self.collectionViewController.collectionView;
    [self addSubview:view];
    //利用VFL添加约束
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *dict = @{@"view": view};
    NSMutableArray *cons = [NSMutableArray arrayWithCapacity:1];
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:dict]];
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:dict]];
    [self addConstraints:cons];
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change{
    [super scrollViewContentOffsetDidChange:change];
    NSValue *value = [change objectForKey:@"new"];
    // 获取当前偏移量
    CGFloat offsetY = value.CGPointValue.y;
//    if (offsetY < 0)
//        self.frame = CGRectMake(offsetY, offsetY, self.if_w - offsetY * 2, self.if_h - offsetY);
//    else self.frame = CGRectMake(0, 0, self.if_w, self.if_h);
}





@end
