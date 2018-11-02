//
//  GDLinecharModel.h
//  GDCharts
//
//  Created by tiger on 2018/11/2.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GDLinecharModel : NSObject

//收盘价
@property (nonatomic, copy) NSString      *closingPrice;
//收盘时间
@property (nonatomic, assign) NSInteger   closingTime;

@property (nonatomic, assign) CGPoint     position;



@end


