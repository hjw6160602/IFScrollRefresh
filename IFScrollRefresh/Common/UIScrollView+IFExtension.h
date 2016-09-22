//
//  UIScrollView+IFExtension.h
//  IFScrollRefreshDemo
//
//  Created by SaiDicaprio. on 16/9/22.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (IFExtension)
@property (assign, nonatomic) CGFloat if_insetT;
@property (assign, nonatomic) CGFloat if_insetB;
@property (assign, nonatomic) CGFloat if_insetL;
@property (assign, nonatomic) CGFloat if_insetR;

@property (assign, nonatomic) CGFloat if_offsetX;
@property (assign, nonatomic) CGFloat if_offsetY;

@property (assign, nonatomic) CGFloat if_contentW;
@property (assign, nonatomic) CGFloat if_contentH;
@end
