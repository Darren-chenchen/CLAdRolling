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
        self.lableNew = [[UILabel alloc] init];
        self.lableNew.textColor = [UIColor redColor];
        self.lableNew.layer.cornerRadius = 3;
        self.lableNew.font = [UIFont systemFontOfSize:12];
        self.lableNew.layer.borderWidth = 1;
        self.lableNew.layer.borderColor = [UIColor redColor].CGColor;
        [self.contentView addSubview:self.lableNew];
        self.lableNew.text = @"最新";
        self.lableNew.textAlignment = NSTextAlignmentCenter;
        
        self.lableHot = [[UILabel alloc] init];
        self.lableHot.textAlignment = NSTextAlignmentCenter;
        self.lableHot.textColor = [UIColor redColor];
        self.lableHot.layer.cornerRadius = 3;
        self.lableHot.font = [UIFont systemFontOfSize:12];
        self.lableHot.layer.borderWidth = 1;
        self.lableHot.layer.borderColor = [UIColor redColor].CGColor;
        [self.contentView addSubview:self.lableHot];
        self.lableHot.text = @"热门";

        
        self.lableContent1 = [[UILabel alloc] init];
        self.lableContent1.userInteractionEnabled = YES;
        self.lableContent1.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.lableContent1];
        [self.lableContent1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickContentLable1)]];
        
        self.lableContent2 = [[UILabel alloc] init];
        self.lableContent2.userInteractionEnabled = YES;
        self.lableContent2.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.lableContent2];
        [self.lableContent2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickContentLable2)]];

        
        self.contentView.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.lableNew.frame = CGRectMake(10, 5, 30, 20);
    self.lableHot.frame = CGRectMake(10, 30, 30, 20);
    
    self.lableContent1.frame = CGRectMake(CGRectGetMaxX(self.lableNew.frame)+15, self.lableNew.frame.origin.y, self.contentView.frame.size.width-60, 20);
    self.lableContent2.frame = CGRectMake(CGRectGetMaxX(self.lableNew.frame)+15, self.lableHot.frame.origin.y, self.contentView.frame.size.width-60, 20);
}

- (void)setAdModel:(CLHomeAdModel *)adModel
{
}

- (void)setContentArray:(NSArray *)contentArray
{
    _contentArray = contentArray;
    self.lableContent1.text = contentArray[0];
    self.lableContent2.text = contentArray[1];
}
- (void)clickContentLable1
{
    self.clickLable1();
}
- (void)clickContentLable2
{
    self.clickLable2();
}
@end

