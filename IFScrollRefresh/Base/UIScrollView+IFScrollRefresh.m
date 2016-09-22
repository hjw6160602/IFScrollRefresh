//
//  UIScrollView+IFScrollRefresh.m
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/22.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "UIScrollView+IFScrollRefresh.h"
#import "NSObject+IF_MethodSwizzling.h"
#import "IFScrollRefreshHeader.h"
#import <objc/runtime.h>


static char * const IFHeaderViewKey = "IFHeaderViewKey";

@implementation UIScrollView (IFScrollRefresh)

- (IFScrollRefreshHeader *)if_header{
    return self.if_header;
}

- (void)setIf_header:(IFScrollRefreshHeader *)if_header{
    objc_setAssociatedObject(self, IFHeaderViewKey, if_header, OBJC_ASSOCIATION_ASSIGN);
}


@end
