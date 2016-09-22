//
//  UIScrollView+IFExtension.m
//  IFScrollRefreshDemo
//
//  Created by SaiDicaprio. on 16/9/22.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "UIScrollView+IFExtension.h"
#import <objc/runtime.h>

@implementation UIScrollView (IFIFExtension)

- (void)setIf_insetT:(CGFloat)if_insetT
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = if_insetT;
    self.contentInset = inset;
}

- (CGFloat)if_insetT
{
    return self.contentInset.top;
}

- (void)setIf_insetB:(CGFloat)if_insetB
{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = if_insetB;
    self.contentInset = inset;
}

- (CGFloat)if_insetB
{
    return self.contentInset.bottom;
}

- (void)setIf_insetL:(CGFloat)if_insetL
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = if_insetL;
    self.contentInset = inset;
}

- (CGFloat)if_insetL
{
    return self.contentInset.left;
}

- (void)setIf_insetR:(CGFloat)if_insetR
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = if_insetR;
    self.contentInset = inset;
}

- (CGFloat)if_insetR
{
    return self.contentInset.right;
}

- (void)setIf_offsetX:(CGFloat)if_offsetX
{
    CGPoint offset = self.contentOffset;
    offset.x = if_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)if_offsetX
{
    return self.contentOffset.x;
}

- (void)setIf_offsetY:(CGFloat)if_offsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = if_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)if_offsetY
{
    return self.contentOffset.y;
}

- (void)setIf_contentW:(CGFloat)if_contentW
{
    CGSize size = self.contentSize;
    size.width = if_contentW;
    self.contentSize = size;
}

- (CGFloat)if_contentW
{
    return self.contentSize.width;
}

- (void)setIf_contentH:(CGFloat)if_contentH
{
    CGSize size = self.contentSize;
    size.height = if_contentH;
    self.contentSize = size;
}

- (CGFloat)if_contentH
{
    return self.contentSize.height;
}
@end
