//
//  GDChartsConfigModel.m
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDChartsConfigModel.h"

@implementation GDChartsConfigModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.chartsContentViewWidth = [UIScreen mainScreen].bounds.size.width;
        self.chartsContentViewHeight = 260;
        
        self.chartsDisplayViewWidth = self.chartsContentViewWidth ;
        self.chartsDisplayViewHeight = self.chartsContentViewHeight;
        
        self.chartsWidth = self.chartsDisplayViewWidth;
        self.chartsHeight = self.chartsDisplayViewHeight - 20;
        self.candleWidth = 3;
    }
    return self;
}


































@end




