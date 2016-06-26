//
//  CLHomeHeader.m
//  CLZhongZi
//
//  Created by darren on 16/3/7.
//  Copyright © 2016年 shanku. All rights reserved.
//

#define CLMaxSections 100

#import "CLHomeHeader.h"
#import "CLAdCollectionCell.h"

@interface CLHomeHeader()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>

@property (nonatomic,weak) UICollectionView *collectionView;

/***/
@property (nonatomic,weak) UIImageView *placehoder;

@end

@implementation CLHomeHeader

static NSString *ADID = @"adCell";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 充当占位图片
        UIImageView *placehoder = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        placehoder.image = [UIImage imageNamed:@"index_top_zhanweizhi"];
        [self addSubview:placehoder];
        placehoder.userInteractionEnabled = YES;
        self.placehoder = placehoder;
    }
    return self;
}
- (NSArray *)newses
{
    if (_newses == nil) {
        self.newses = [NSArray array];
    }
    return _newses;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 创建滚动视图
    [self setupCollectionView];
    // 开启定时器
    if (self.newses.count>1) {
        [self addTimer];
    }
    [self.placehoder removeFromSuperview];

}

/*创建自动滚动视图*/
- (void)setupCollectionView
{
    // 创建collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.ImgW, self.ImgH) collectionViewLayout:layout];
    layout.itemSize = CGSizeMake(self.ImgW, self.ImgH);
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.scrollEnabled = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self addSubview:collectionView];
    self.collectionView = collectionView;

    // 注册cell
    [self.collectionView registerClass:[CLAdCollectionCell class] forCellWithReuseIdentifier:ADID];
    // 默认显示最中间的那组
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:CLMaxSections/2] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
}

/**
 *  添加定时器
 */
- (void)addTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

/**
 *  移除定时器
 */
- (void)removeTimer
{
    // 停止定时器
    [self.timer invalidate];
    self.timer = nil;
}

- (NSIndexPath *)resetIndexPath
{
    // 当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    // 马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:CLMaxSections/2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
    return currentIndexPathReset;
}

/**
 *  下一页
 */
- (void)nextPage
{
    // 1.马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [self resetIndexPath];
    
    // 2.计算出下一个需要展示的位置
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.newses.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    // 3.通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.newses.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return CLMaxSections;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CLAdCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ADID forIndexPath:indexPath];
    cell.adUrl = self.newses[indexPath.row];
    cell.cellW = self.ImgW;
    cell.cellH = self.ImgH;
    
    __weak CLHomeHeader *weakSelf = self;
    cell.clickImg = ^{
        weakSelf.cliclCell();
    };
    return cell;
}

#pragma mark  - UICollectionViewDelegate
/**
 *  当用户即将开始拖拽的时候就调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

/**
 *  当用户停止拖拽的时候就调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
@end
