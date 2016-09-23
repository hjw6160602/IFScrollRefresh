//
//  IFScrollRefreshHeader.m
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/22.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "IFScrollRefreshHeader.h"
#import "UIView+IFExtension.h"

@implementation IFScrollRefreshHeader

+ (instancetype)headerWithFrame:(CGRect)frame{
    IFScrollRefreshHeader *header = [[IFScrollRefreshHeader alloc]initWithFrame:frame];
    return header;
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

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change{
    [super scrollViewContentOffsetDidChange:change];
    NSValue *value = [change objectForKey:@"new"];
    // 获取当前偏移量
    CGFloat offsetY = value.CGPointValue.y;
    if (offsetY < 0)
        self.frame = CGRectMake(offsetY, offsetY, self.if_w - offsetY * 2, self.if_h - offsetY);
    else self.frame = CGRectMake(0, 0, self.if_w, self.if_h);
}





@end
