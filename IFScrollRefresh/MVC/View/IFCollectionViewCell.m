//
//  IFCollectionViewCell.m
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/23.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "IFCollectionViewCell.h"

@implementation IFCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:self.image];
    imgView.frame = self.bounds;
    [self addSubview:imgView];
}

@end
