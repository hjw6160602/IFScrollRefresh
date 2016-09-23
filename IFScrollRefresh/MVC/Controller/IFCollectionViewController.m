//
//  IFCollectionViewController.m
//  IFScrollRefreshDemo
//
//  Created by liuwy on 16/9/23.
//  Copyright © 2016年 MetYourMakers. All rights reserved.
//

#import "IFCollectionViewController.h"
#import "IFCollectionViewCell.h"
#import "UIView+IFExtension.h"

@interface IFCollectionViewController ()

@end

static NSString * const reuserID = @"imgItemReuseID";

@implementation IFCollectionViewController//<UICollectionViewDataSource, UICollectionViewDelegate>

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithCollectionViewLayout:layout]){
        [self.collectionView registerClass:[IFCollectionViewCell class] forCellWithReuseIdentifier:reuserID];
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)layout;
//        flowLayout.itemSize = self.view.if_size;
        self.collectionView.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    IFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuserID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    cell.image = self.images[indexPath.row];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>





@end
