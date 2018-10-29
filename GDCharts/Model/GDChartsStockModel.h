//
//  GDChartsStockModel.h
//  GDCharts
//
//  Created by tiger on 2018/10/29.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDChartsStockModel : NSObject
//收盘价
@property (nonatomic,copy) NSString     *closingPrice;
//收盘时间
@property (nonatomic,assign) NSInteger   closingTime;

@end

