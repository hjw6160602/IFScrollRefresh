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
#import "UIView+IFExtension.h"
#import <objc/runtime.h>

@implementation UIScrollView (IFScrollRefresh)

static char const IFHeaderViewKey = '\0';

#pragma mark - getter
- (UIView *)if_header{
    return  (IFScrollRefreshHeader *)objc_getAssociatedObject(self, &IFHeaderViewKey);
}

#pragma mark - setter
- (void)setIf_header:(IFScrollRefreshHeader *)if_header{
    //由于这里的if_head在后面被insert到了self的subview上面，所以在采用属性修饰的时候可以采用弱引用assign
    //如果是基本数据类型作为一个分类的属性，在被描述的时候，可能会在属性修饰符里面写着assign，但是在这里由于是给分类添加属性，所以它的传入值必须是一个id类型的，那么需要将基本数据类型进行一层OC包装，被包装后的对象是一个NSNumber类型的OC对象，所以这种情况下应当描述为retain/copy，否则在get方法里可能会因为NSValue对象的释放而取不到值，报BAD_EXEC的野指针错误。
    objc_setAssociatedObject(self, &IFHeaderViewKey, if_header, OBJC_ASSOCIATION_ASSIGN);
    
    [self insertSubview:if_header atIndex:0];
    self.if_offsetY = -if_header.if_h;
    self.contentInset = UIEdgeInsetsMake(self.if_header.if_h, 0, 0, 0);
}

@end
