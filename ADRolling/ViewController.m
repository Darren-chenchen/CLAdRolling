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

    CLHomeHeader *header = [[CLHomeHeader alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    header.newses = @[@[@"第0组第一行",@"第0组第二行"],@[@"第一组第一行",@"第一组第二行"],@[@"第二组第一行",@"第二组第一行"],@[@"第3组第一行",@"第3组第二行"]];
    header.cliclCelllable1 = ^{
        NSLog(@"点击了广告1");
    };
    header.cliclCelllable2 = ^{
        NSLog(@"点击了广告2");
    };
    [self.view addSubview:header];
}

@end
