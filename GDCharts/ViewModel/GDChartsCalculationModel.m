//
//  GDChartsCalculationModel.m
//  GDCharts
//
//  Created by tiger on 2018/10/30.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDChartsCalculationModel.h"
#import "GDChartsConfigModel.h"
#import "GDStockModel.h"
#import "GDCategories.h"
#import "GDLinecharModel.h"

#define defaultScale    16


@implementation GDChartsCalculationModel

/**
 计算显示所有 models 需要的ContentView的宽高,(目前主要计算宽度，高度不变)
 @param models 所有的数据
 */
- (CGRect)calcContentViewRectWithConfigModel:(GDChartsConfigModel *)configModel models:(NSArray *)models{
    CGRect result = CGRectZero;
    
    NSInteger count = models.count;
    CGFloat width = configModel.candleWidth * count;
    
    width = width + 100;
    result = CGRectMake(0, 0, width, configModel.chartsContentViewHeight);
    return result;
}

/**
 算出 当前屏幕上这一帧的第一个点在models中的index
 
 @param models 所有的数据
 @param offset scrollView的X轴偏移位置
 @return -1 表示无效
 */
- (NSInteger)calcDisplayStartIndexWithConfigModel:(GDChartsConfigModel *)configModel models:(NSArray *)models offset:(CGFloat)offset{
    
    NSInteger startIndex = offset/configModel.candleWidth;
    if (startIndex >= models.count || startIndex < 0 ) return -1;            
    return startIndex;
}

/**
 models 内 最高和最低价格差
 */
- (NSString *)stockSpread:(NSArray *)models{
    NSArray *array = [self maxMinPrice:models];
    NSString *maxNumber = array.firstObject;
    NSString *minNumber = array.lastObject;
    NSString *result = gd_sub(maxNumber, minNumber, defaultScale);
    return result;
}

- (NSArray *)maxMinPrice:(NSArray *)models{
    //数字没处理
    NSNumber *maxNumber = [[models valueForKeyPath:@"closingPrice"] valueForKeyPath:@"@max.doubleValue"];
    NSNumber *minNumber = [[models valueForKeyPath:@"closingPrice"] valueForKeyPath:@"@min.doubleValue"];
    return @[maxNumber.stringValue, minNumber.stringValue];
}





/**
 截取当前屏幕上这一帧显示的models
 @param displayStartIndex 当前屏幕上这一帧的第一个点在models中的index
 @param models 所有的数据
 @return 当前屏幕上这一帧的数据
 */
- (NSArray *)subDisplayModelsWithConfigModel:(GDChartsConfigModel *)configModel displayStartIndex:(NSInteger)displayStartIndex models:(NSArray *)models{
    
    NSInteger count = models.count;
    if ( 0 == count ) return @[];
    
    //计算单页最大绘制的数目，因为贝塞尔曲线宽度原因，可能在屏幕边缘出现， 可以适当酌情的多加1-2个点的宽度
//    NSInteger drawMaxCount = ceil (configModel.chartsDisplayViewWidth / configModel.candleWidth) + 2;
    NSInteger drawMaxCount = ceil (configModel.chartsWidth / configModel.candleWidth);

    
    NSInteger startIndex = displayStartIndex;
    NSInteger len = 0;
    NSRange range;
    if (startIndex >= count || startIndex < 0) {
        //异常
        return @[];
    }
    
    if (startIndex + drawMaxCount < count) {
        //满页的情况, 屏幕上的点刚好绘制满整页
        len = drawMaxCount;
    }else{
        //数据不够绘制满一页
        len = count - startIndex;
    }
    
    if (len >= count){
        //异常情况
        return @[];
    }    
    range = NSMakeRange(startIndex, len);
    NSArray *result = [models subarrayWithRange:range];
    return result;
}






/**
 计算 displayModels在当前屏幕上这一帧的坐标(x,y)。 这个坐标不等于 scrollView.contentView的坐标。
 
 @param maxMinPrice  [maxPrice, minPrice], displayModels的收盘价 在 [maxPrice, minPrice] 这些价格范围内
 @param displayStartIndex 当前屏幕上这一帧的第一个点在models中的index
 @param offset scrollView X轴偏移量
 @param displayModels 当前屏幕上这一帧的数据
 */
- (NSArray *)calcPositionWithConfigModel:(GDChartsConfigModel *)configModel maxMinPrice:(NSArray *)maxMinPrice
                       displayStartIndex:(NSInteger)displayStartIndex offset:(CGFloat)offset displayModels:(NSArray *)displayModels{
    
    NSMutableArray *result = [NSMutableArray new];
    
    NSString *maxPrice = maxMinPrice.firstObject;
    NSString *minPrice = maxMinPrice.lastObject;
    NSInteger startIndex = displayStartIndex;

    NSString *stockSpread = gd_sub(maxPrice, minPrice, defaultScale);
    NSString *maxY = [NSString numberWithDouble:configModel.linechartHeight];
    NSString *minY = @"0";
    NSString *height = gd_sub(maxY, minY, defaultScale);
//    CGFloat unitValue = (maxPrice - minPrice)/(maxY - minY);
    NSString *unitValue = gd_div(stockSpread, height, defaultScale);
    if ([unitValue gd_isZero]) unitValue = @"0.001";
    
    
    CGFloat firstPointX =  offset - startIndex*configModel.candleWidth;
//
    for (NSInteger index=0; index<displayModels.count; index++) {
        GDStockModel *stockModel = displayModels[index];
        CGFloat xPosition = firstPointX + index * configModel.candleWidth;
        CGFloat yPosition = 0.0;
        {
//            CGFloat yPosition = ABS(maxY - (stockModel.closingPrice.doubleValue - minPrice)/unitValue);
            NSString *sprice = gd_sub(stockModel.closingPrice, minPrice, defaultScale);
            NSString *y = gd_div(sprice, unitValue, defaultScale);
            yPosition = ABS(gd_sub(minY, y, 6).doubleValue);
        }

        GDLinecharModel *linecharModel = [GDLinecharModel new];
        linecharModel.closingPrice = stockModel.closingPrice;
        linecharModel.closingTime = stockModel.closingTime;
        linecharModel.position = CGPointMake(xPosition, yPosition);                
        [result addObject:linecharModel];
    }
    
    return result;
}










































@end

