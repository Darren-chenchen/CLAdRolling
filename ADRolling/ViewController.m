//
//  ViewController.m
//  ADRolling
//
//  Created by darren on 16/6/26.
//  Copyright © 2016年 shanku. All rights reserved.
//

#import "ViewController.h"
#import "CLHomeHeader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CLHomeHeader *header = [[CLHomeHeader alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    header.newses = @[];
    header.ImgW = self.view.frame.size.width;
    header.ImgH = 44;
    header.cliclCell = ^{
        NSLog(@"点击了广告");
    };
    [self.view addSubview:header];
    
}

@end
