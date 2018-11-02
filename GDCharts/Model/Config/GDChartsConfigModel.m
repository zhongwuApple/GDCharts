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
        
        self.chartsWidth = self.chartsContentViewWidth ;
        self.chartsHeight = self.chartsContentViewHeight;
        
        self.linechartWidth = self.chartsWidth;
        self.linechartHeight = self.chartsHeight - 20;
        self.candleWidth = 3;
    }
    return self;
}


































@end




