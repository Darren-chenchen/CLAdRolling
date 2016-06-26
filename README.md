# CLAdRolling
滚动广告的实现
CLHomeHeader *header = [[CLHomeHeader alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];

    header.newses = @[];
    
    header.ImgW = self.view.frame.size.width;
    
    header.ImgH = 44;
    
    header.cliclCell = ^{
    
        NSLog(@"点击了广告");
        
    };
    
    [self.view addSubview:header];
    
