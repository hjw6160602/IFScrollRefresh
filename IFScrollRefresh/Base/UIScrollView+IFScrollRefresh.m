//
//  UIScrollView+IFScrollRefresh.m
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/22.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "UIScrollView+IFScrollRefresh.h"
#import "UIScrollView+IFExtension.h"
#import "IFScrollRefreshHeader.h"
#import "NSObject+IFExtension.h"
#import "UIView+IFExtension.h"
#import <objc/runtime.h>


static char * const IFHeaderViewKey = "IFHeaderViewKey";
static char * const IFHeaderViewHeightKey = "IFHeaderViewHeightKey";
// 默认图片高度
static CGFloat const DefaultIFHeaderViewHeight = 200;

@implementation UIScrollView (IFScrollRefresh)

+ (void)load{
    [self if_swizzleInstanceSelector:@selector(setTableHeaderView:) swizzleSelector:@selector(setIf_TableHeaderView:)];
}

// 拦截通过代码设置tableView头部视图
- (void)setIf_TableHeaderView:(UIView *)tableHeaderView{
    // 不是UITableView,就不需要做下面的事情
    if (![self isMemberOfClass:[UITableView class]]) return;
    
    // 设置tableView头部视图
    [self setIf_TableHeaderView:tableHeaderView];
    
    // 设置头部视图的位置
    UITableView *tableView = (UITableView *)self;
    
    self.if_headerHeight = tableView.tableHeaderView.if_h;
}



#pragma mark - getter
- (UIView *)if_header{
    return  (IFScrollRefreshHeader *)objc_getAssociatedObject(self, IFHeaderViewKey);
}

- (CGFloat)if_headerHeight{
    CGFloat ifHeaderViewHeight = [objc_getAssociatedObject(self, IFHeaderViewHeightKey) floatValue];

    //如果没有为if_header设置高度，那么默认返回 DefaultIFHeaderViewHeight
    return ifHeaderViewHeight == 0 ? DefaultIFHeaderViewHeight:ifHeaderViewHeight;
}

#pragma mark - setter
- (void)setIf_header:(IFScrollRefreshHeader *)if_header{
    objc_setAssociatedObject(self, IFHeaderViewKey, if_header, OBJC_ASSOCIATION_ASSIGN);
    if_header.if_h = 200;
    
    if ([self isKindOfClass:[UITableView class]]) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
        headerView.backgroundColor = [UIColor clearColor];
        UITableView *tableView = (UITableView *)self;
        tableView.tableHeaderView = headerView;
    }
    
    [self insertSubview:if_header atIndex:0];
}

- (void)setIf_headerHeight:(CGFloat)if_headerHeight{
    objc_setAssociatedObject(self, IFHeaderViewHeightKey, @(if_headerHeight), OBJC_ASSOCIATION_ASSIGN);
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    self.if_offsetY = -10;
    
}

//- (void)setupHeaderViewFrame
//{
////    self.yz_headerImageView.frame = CGRectMake(0 , 0, self.bounds.size.width , self.yz_headerScaleImageHeight);
//    
//    self.if_header.frame = CGRectMake(0, 0, self.if_w, 0);
//    
//}


@end
