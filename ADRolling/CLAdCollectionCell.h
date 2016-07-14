//
//  CLAdCollectionCell.h
//  Budayang
//
//  Created by darren on 16/4/12.
//  Copyright © 2016年 chinaPnr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickLable1Block)();
typedef void(^clickLable2Block)();

@class CLHomeAdModel;

@interface CLAdCollectionCell : UICollectionViewCell

/**广告图片模型*/
//@property (nonatomic,strong) CLHomeAdModel *adModel;
@property (nonatomic,strong) NSArray *contentArray;

@property (nonatomic,strong) UILabel *lableNew;
@property (nonatomic,strong) UILabel *lableHot;
@property (nonatomic,strong) UILabel *lableContent1;
@property (nonatomic,strong) UILabel *lableContent2;

@property (nonatomic,copy) clickLable1Block clickLable1;

@property (nonatomic,copy) clickLable2Block clickLable2;

@end
