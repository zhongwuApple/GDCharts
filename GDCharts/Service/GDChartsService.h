//
//  GDChartsService.h
//  GDCharts
//
//  Created by tiger on 2018/10/29.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface GDChartsService : NSObject


- (RACSignal *)fetchData;

- (RACSignal *)loadMoreData;



































































































    
@end
