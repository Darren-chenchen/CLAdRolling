//
//  CLAdCollectionCell.h
//  Budayang
//
//  Created by darren on 16/4/12.
//  Copyright © 2016年 chinaPnr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickImageBlock)();
@class CLHomeAdModel;

@interface CLAdCollectionCell : UICollectionViewCell

// item 的尺寸
/**宽度*/
@property (nonatomic,assign) NSInteger cellW;
/**高度*/
@property (nonatomic,assign) NSInteger cellH;

/**广告*/
@property (nonatomic,strong) UIImageView *adImageView;

/**广告图片模型*/
//@property (nonatomic,strong) CLHomeAdModel *adModel;
@property (nonatomic,strong) NSString *adUrl;

@property (nonatomic,copy) clickImageBlock clickImg;

@end
