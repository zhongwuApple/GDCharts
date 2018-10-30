//
//  GDChartsCalculationModel.m
//  GDCharts
//
//  Created by tiger on 2018/10/30.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDChartsCalculationModel.h"
#import "GDChartsConfigModel.h"

@implementation GDChartsCalculationModel



- (CGRect)calcRectWithModels:(NSArray *)models configModel:(GDChartsConfigModel *)configModel{
    
    CGRect result = CGRectZero;
    
    NSInteger count = models.count;
    CGFloat width = configModel.candleWidth * count;
    
    width = width + 100;
    result = CGRectMake(0, 0, width, configModel.chartsContentViewHeight);
    return result;
}



















































@end

