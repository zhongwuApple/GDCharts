//
//  GDChartsViewModel.h
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDChartsConfigModel.h"


@protocol GDChartsViewModelDelegate <NSObject>

//重置视图配置(sysmbl 账号切换等需要重置)
//- (void)restChartViewConfig;

- (void)updateContentView:(CGRect )rect;

- (void)updateRenderResource:(NSDictionary *)resource;

//- (void)resetDatas;

@end

@interface GDChartsViewModel : NSObject

@property (nonatomic, weak) id<GDChartsViewModelDelegate>          delegate;

@property (nonatomic, strong) GDChartsConfigModel                 *configModel;


@property (nonatomic, strong) NSMutableArray                      *stockModels;



- (instancetype)initConfigModel:(GDChartsConfigModel *)aconfigModel;


- (void)updateTargetContentOffset:(CGPoint)targetContentOffset;



@end

