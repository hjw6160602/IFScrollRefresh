//
//  NSObject+IFExtension.h
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/23.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (IF_Ivars)

/** 获取成员属性列表 */
+ (NSArray<NSString *> *)getIvarNameList;

@end

/*  分类的目的：实现两个方法实现的交换，调用原有方法，有现有方法(自己实现方法)的实现  */
@interface NSObject (IF_MethodSwizzling)

/**
 *  交换对象方法
 *
 *  @param origSelector    原有方法
 *  @param swizzleSelector 现有方法(自己实现方法)
 */
+ (void)if_swizzleInstanceSelector:(SEL)origSelector
                   swizzleSelector:(SEL)swizzleSelector;

/**
 *  交换类方法
 *
 *  @param origSelector    原有方法
 *  @param swizzleSelector 现有方法(自己实现方法)
 */
+ (void)if_swizzleClassSelector:(SEL)origSelector
                swizzleSelector:(SEL)swizzleSelector;

@end


