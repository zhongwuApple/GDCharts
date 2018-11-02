//
//  GDChartsCalculationModel.h
//  GDCharts
//
//  Created by tiger on 2018/10/30.
//  Copyright © 2018 tiger. All rights reserved.
//
//  当前屏幕上这一帧的数据  不一定等于 屏幕上显示的点。 有可能大于屏幕上显示的点, 每一帧刷新的数据 可以有屏幕外的数据

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GDChartsConfigModel;
@interface GDChartsCalculationModel : NSObject



/**
 计算显示所有 models 需要的ContentView的宽高,(目前主要计算宽度，高度不变)
 @param models 所有的数据
 */
- (CGRect)calcContentViewRectWithConfigModel:(GDChartsConfigModel *)configModel models:(NSArray *)models;


/**
 算出 当前屏幕上这一帧的第一个点在models中的index
 
 @param models 所有的数据
 @param offset scrollView的X轴偏移位置
 @return -1 表示无效
 */
- (NSInteger)calcDisplayStartIndexWithConfigModel:(GDChartsConfigModel *)configModel models:(NSArray *)models offset:(CGFloat)offset;




/**
 截取当前屏幕上这一帧显示的models
 @param displayStartIndex 当前屏幕上这一帧的第一个点在models中的index
 @param models 所有的数据
 @return 当前屏幕上这一帧的数据
 */
- (NSArray *)subDisplayModelsWithConfigModel:(GDChartsConfigModel *)configModel displayStartIndex:(NSInteger)displayStartIndex models:(NSArray *)models;




/**
 计算 displayModels在当前屏幕上这一帧的坐标(x,y)。 这个坐标不等于 scrollView.contentView的坐标。

 @param maxMinPrice  [maxPrice, minPrice], displayModels的收盘价 在 [maxPrice, minPrice] 这些价格范围内
 @param displayStartIndex 当前屏幕上这一帧的第一个点在models中的index
 @param offset scrollView X轴偏移量
 @param displayModels 当前屏幕上这一帧的数据
 */
- (NSArray *)calcPositionWithConfigModel:(GDChartsConfigModel *)configModel maxMinPrice:(NSArray *)maxMinPrice
                       displayStartIndex:(NSInteger)displayStartIndex offset:(CGFloat)offset displayModels:(NSArray *)displayModels;

/**
 models 内 最高和最低价格差
 */
- (NSString *)stockSpread:(NSArray *)models;

- (NSArray *)maxMinPrice:(NSArray *)models;























































@end


