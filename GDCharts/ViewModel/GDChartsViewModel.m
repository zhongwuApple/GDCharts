//
//  GDChartsViewModel.m
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDChartsViewModel.h"
#import "GDChartsService.h"
#import "GDChartsCalculationModel.h"


@interface GDChartsViewModel()

@property (nonatomic, strong) GDChartsService           *service;
@property (nonatomic, strong) GDChartsCalculationModel  *calculationModel;
@end

@implementation GDChartsViewModel

- (instancetype)initConfigModel:(GDChartsConfigModel *)aconfigModel
{
    self = [super init];
    if (self) {
        _configModel = aconfigModel;
        [self setup];
    }
    return self;
}


- (void)setup{
    self.service = [GDChartsService new];
    self.calculationModel = [GDChartsCalculationModel new];
    self.stockModels = [NSMutableArray new];
    
    @weakify(self);
    [[self.service fetchData] subscribeNext:^(NSArray *array) {
        @strongify(self);
        [self updateStockModelsWithArray:array];
    }];
    
}


- (void)updateStockModelsWithArray:(NSArray *)array{
    if ( 0 == array.count ) return;
    [self.stockModels addObjectsFromArray:array];
    CGRect rect = [self.calculationModel calcRectWithModels:self.stockModels configModel:self.configModel];
    self.configModel.chartsContentViewWidth = rect.size.width;
    
    if ([self.delegate respondsToSelector:@selector(updateContentView:)]) {
        [self.delegate updateContentView:rect];
    }        
}





























@end


