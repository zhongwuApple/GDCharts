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
@property (nonatomic, assign, readonly) CGFloat                           chartsContentViewWidth;
//单页 图表的宽度
@property (nonatomic, assign, readonly) CGFloat                           chartsDisplayViewWidth;
//单页 图表的高度
@property (nonatomic, assign, readonly) CGFloat                           chartsDisplayViewHeight;

//绘制图表的宽高 chartsContentViewWidth >= chartsWidth  chartsDisplayViewHeight >= chartsHeight;
@property (nonatomic, assign, readonly) CGFloat                           chartsWidth;
@property (nonatomic, assign, readonly) CGFloat                           chartsHeight;


#pragma mark 网格
//单个网格在屏幕上的宽度
// gridWidth = (chartsDisplayViewWidth-timeViewOffset) / verticalLineCount;
@property (nonatomic, assign, readonly) CGFloat                           gridWidth;
@property (nonatomic, assign, readonly) CGFloat                           gridHeight;


















@end
