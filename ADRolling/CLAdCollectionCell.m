//
//  CLAdCollectionCell.m
//  Budayang
//
//  Created by darren on 16/4/12.
//  Copyright © 2016年 chinaPnr. All rights reserved.
//

#import "CLAdCollectionCell.h"

@implementation CLAdCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.adImageView = [[UIImageView alloc] init];
        [self.adImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clcikImg)]];
        [self.contentView addSubview:self.adImageView];
        self.adImageView.userInteractionEnabled = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.adImageView.frame = CGRectMake(0, 0, self.cellW, self.cellH);
}

- (void)setAdModel:(CLHomeAdModel *)adModel
{
}

- (void)setAdUrl:(NSString *)adUrl
{
    _adUrl = adUrl;
    self.adImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:adUrl]] scale:1];
}

- (void)clcikImg
{
    self.clickImg();
}
@end

