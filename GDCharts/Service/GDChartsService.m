//
//  GDChartsService.m
//  GDCharts
//
//  Created by tiger on 2018/10/29.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDChartsService.h"
#import <DateTools/DateTools.h>
#import "GDChartsStockModel.h"

@implementation GDChartsService


- (NSString *)randomPrice{
    NSInteger number = (arc4random() % 100) + 200;
    NSString *result = [NSString stringWithFormat:@"%zd", number];
    return result;
}


- (NSArray *)testData{
    NSInteger count = 400;
    NSInteger currentTime = [[NSDate date] timeIntervalSince1970];
    NSMutableArray *result = [NSMutableArray new];
    for (NSInteger index=0; index<400; index++) {
        GDChartsStockModel *amodel = [GDChartsStockModel new];
        amodel.closingTime = currentTime-index;
        amodel.closingPrice = [self randomPrice];
    }        
    return result;
}

- (RACSignal *)fetchData{
    return [RACSignal return:[self testData]];
}

















@end

