//
//  GDChartsService.m
//  GDCharts
//
//  Created by tiger on 2018/10/29.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDChartsService.h"
#import <DateTools/DateTools.h>
#import "GDStockModel.h"

@implementation GDChartsService


- (NSString *)randomPrice{
    NSInteger number = (arc4random() % 100) + 200;
    NSString *result = [NSString stringWithFormat:@"%ld", (long)number];
    return result;
}


- (NSArray *)testData{
    NSInteger count = 400;
    NSInteger currentTime = [[NSDate date] timeIntervalSince1970];
    NSMutableArray *result = [NSMutableArray new];
    for (NSInteger index=0; index<count; index++) {
        GDStockModel *amodel = [GDStockModel new];
        amodel.closingTime = currentTime-index;
        amodel.closingPrice = [self randomPrice];
        [result addObject:amodel];
    }        
    return result;
}

- (RACSignal *)fetchData{        
    return [[RACSignal return:[self testData]] delay:0.2];
}




- (RACSignal *)loadMoreData{
    return nil;
}












@end


