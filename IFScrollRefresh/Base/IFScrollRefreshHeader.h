//
//  IFScrollRefreshHeader.h
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/22.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "IFScrollRereshComponent.h"

@interface IFScrollRefreshHeader : IFScrollRereshComponent

@property (nonatomic, copy)NSArray *imgNames;

+ (instancetype)headerWithFrame:(CGRect)frame;

@end
