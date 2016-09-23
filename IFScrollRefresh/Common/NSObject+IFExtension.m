//
//  NSObject+IFExtension.m
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/23.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "NSObject+IFExtension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

+ (NSArray<NSString *> *)getIvarNameList{
    unsigned int outCount, i;
    NSMutableArray *ivarsArr = [NSMutableArray arrayWithCapacity:1];
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++){
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        NSString *ivarName = [NSString stringWithFormat:@"_%@",propertyName];
        [ivarsArr addObject:ivarName];
    }
    return [ivarsArr copy];
}

@end

@implementation NSObject (IF_MethodSwizzling)
+ (void)if_swizzleInstanceSelector:(SEL)origSelector
swizzleSelector:(SEL)swizzleSelector {
    
    // 获取原有方法
    Method origMethod = class_getInstanceMethod(self,
                                                origSelector);
    // 获取交换方法
    Method swizzleMethod = class_getInstanceMethod(self,
                                                   swizzleSelector);
    
    // 注意：不能直接交换方法实现，需要判断原有方法是否存在,存在才能交换
    // 如何判断？添加原有方法，如果成功，表示原有方法不存在，失败，表示原有方法存在
    // 原有方法可能没有实现，所以这里添加方法实现，用自己方法实现
    // 这样做的好处：方法不存在，直接把自己方法的实现作为原有方法的实现，调用原有方法，就会来到当前方法的实现
    BOOL isAdd = class_addMethod(self, origSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (!isAdd) { // 添加方法失败，表示原有方法存在，直接替换
        method_exchangeImplementations(origMethod, swizzleMethod);
    }else {
        class_replaceMethod(self, swizzleSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
}

+ (void)if_swizzleClassSelector:(SEL)origSelector swizzleSelector:(SEL)swizzleSelector
{
    // 获取原有方法
    Method origMethod = class_getClassMethod(self,
                                             origSelector);
    // 获取交换方法
    Method swizzleMethod = class_getClassMethod(self,
                                                swizzleSelector);
    
    // 添加原有方法实现为当前方法实现
    BOOL isAdd = class_addMethod(self, origSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (!isAdd) { // 添加方法失败，原有方法存在，直接替换
        method_exchangeImplementations(origMethod, swizzleMethod);
    }
}
@end