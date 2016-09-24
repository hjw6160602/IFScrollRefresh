//
//  IFScrollRefreshHeader.h
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/22.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "IFScrollRereshComponent.h"

@interface IFScrollRefreshHeader : IFScrollRereshComponent
/** 根据传入的 图片名字数组和图片宽高比来创建图片 */
+ (instancetype)headerWithImageNames:(NSArray *)imgNames AspectRatio:(CGFloat)aspectRatio;

@end
