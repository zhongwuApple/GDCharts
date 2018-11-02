//
//  GDChartsConfigModel.h
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDChartsConfigModel : NSObject



//绘制画面的宽度 包括屏幕外 UIScrollView的ContentView的宽度
@property (nonatomic, assign) CGFloat                           chartsContentViewWidth;

@property (nonatomic, assign) CGFloat                           chartsContentViewHeight;

//单页宽度  chartsViewWidth <= chartsContentViewWidth
@property (nonatomic, assign) CGFloat                           chartsWidth;
//单页高度 chartsViewHeight <= chartsContentViewHeight
@property (nonatomic, assign) CGFloat                           chartsHeight;


@property (nonatomic, assign) CGFloat                           linechartWidth;
@property (nonatomic, assign) CGFloat                           linechartHeight;


#pragma mark 网格
//单个蜡烛在屏幕上的宽度 不能为0
@property (nonatomic, assign) CGFloat                           candleWidth;



















@end
