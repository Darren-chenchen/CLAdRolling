//
//  CLHomeHeader.h
//  CLZhongZi
//
//  Created by darren on 16/3/7.
//  Copyright © 2016年 shanku. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^clickCellLable1Block)();
typedef void(^clickCellLable2Block)();

@class CLHomeAdModel;

@interface CLHomeHeader : UIView

@property (nonatomic, strong) NSArray *newses;

// 放在外部是为了切换另一个页面时，关闭定时器
@property(nonatomic,strong) NSTimer *timer;
- (void)removeTimer;
- (void)addTimer;

@property (nonatomic,copy) clickCellLable1Block cliclCelllable1;
@property (nonatomic,copy) clickCellLable2Block cliclCelllable2;

@end
