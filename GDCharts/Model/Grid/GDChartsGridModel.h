//
//  GDChartsGridModel.h
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GDChartsGridModel : NSObject

//当前竖线的坐标
@property (nonatomic, assign) CGFloat               offsetx;
//hh:mm:ss的字符串
@property (nonatomic, copy) NSString                *time;

@end


