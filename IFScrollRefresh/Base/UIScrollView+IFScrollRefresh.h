//
//  UIScrollView+IFScrollRefresh.h
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/22.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IFScrollRefreshHeader;

@interface UIScrollView (IFScrollRefresh)

/** 下拉刷新控件 */
@property (strong, nonatomic) IFScrollRefreshHeader *if_header;

@end
