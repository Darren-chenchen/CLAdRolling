//
//  CLHomeHeader.h
//  CLZhongZi
//
//  Created by darren on 16/3/7.
//  Copyright © 2016年 shanku. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^clickCellBlock)();

@class CLHomeAdModel;

@interface CLHomeHeader : UIView

@property (nonatomic, strong) NSArray *newses;

// item 的尺寸
/**宽度*/
@property (nonatomic,assign) NSInteger ImgW;
/**高度*/
@property (nonatomic,assign) NSInteger ImgH;
// 放在外部是为了切换另一个页面时，关闭定时器
@property(nonatomic,strong) NSTimer *timer;
- (void)removeTimer;
- (void)addTimer;

@property (nonatomic,copy) clickCellBlock cliclCell;

@end
