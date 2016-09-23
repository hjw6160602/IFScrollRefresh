//
//  IFScrollRereshComponent.m
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/23.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "IFScrollRereshComponent.h"
#import "IFScrollRefreshConst.h"
#import "UIView+IFExtension.h"

@interface IFScrollRereshComponent()
@property (strong, nonatomic) UIPanGestureRecognizer *pan;
@end

@implementation IFScrollRereshComponent

- (void)layoutSubviews
{
    [self placeSubviews];
    
    [super layoutSubviews];
}

- (void)placeSubviews{}



- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    // 如果不是UIScrollView，不做任何事情
    if (newSuperview && ![newSuperview isKindOfClass:[UIScrollView class]]) return;
    
    // 旧的父控件移除监听
    [self removeObservers];
    
    if (newSuperview) { // 新的父控件
        // 设置宽度
        self.if_w = newSuperview.if_w;
        // 设置位置
        self.if_origin = CGPointZero;
        
        // 记录UIScrollView
        _scrollView = (UIScrollView *)newSuperview;
        // 设置永远支持垂直弹簧效果
        _scrollView.alwaysBounceVertical = YES;
        // 记录UIScrollView最开始的contentInset
        _scrollViewOriginalInset = _scrollView.contentInset;
        
        // 添加监听
        [self addObservers];
    }
}

#pragma mark - KVO监听
- (void)addObservers{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:IFScrollRefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:IFScrollRefreshKeyPathContentSize options:options context:nil];
    self.pan = self.scrollView.panGestureRecognizer;
    [self.pan addObserver:self forKeyPath:IFScrollRefreshRefreshKeyPathPanState options:options context:nil];
}

- (void)removeObservers {
    [self.superview removeObserver:self forKeyPath:IFScrollRefreshKeyPathContentOffset];
    [self.superview removeObserver:self forKeyPath:IFScrollRefreshKeyPathContentSize];;
    [self.pan removeObserver:self forKeyPath:IFScrollRefreshRefreshKeyPathPanState];
    self.pan = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 遇到这些情况就直接返回
    if (!self.userInteractionEnabled) return;
    // 这个就算看不见也需要处理
    if ([keyPath isEqualToString:IFScrollRefreshKeyPathContentSize]) {
        [self scrollViewContentSizeDidChange:change];
    }
    
    // 隐藏状态下直接返回
    if (self.hidden) return;
    if ([keyPath isEqualToString:IFScrollRefreshKeyPathContentOffset]) {
        [self scrollViewContentOffsetDidChange:change];
    } else if ([keyPath isEqualToString:IFScrollRefreshRefreshKeyPathPanState]) {
        [self scrollViewPanStateDidChange:change];
    }
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change{}
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change{}
- (void)scrollViewPanStateDidChange:(NSDictionary *)change{}




@end
