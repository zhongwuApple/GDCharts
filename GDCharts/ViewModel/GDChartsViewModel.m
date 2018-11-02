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

@property (nonatomic, assign) CGPoint                   targetContentOffset;

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
    CGRect rect = [self.calculationModel calcContentViewRectWithConfigModel:self.configModel models:self.stockModels];
    self.configModel.chartsContentViewWidth = rect.size.width;
    if ([self.delegate respondsToSelector:@selector(updateContentView:)]) {
        [self.delegate updateContentView:rect];
    }    
    [self updateRenderResource];
}





- (void)updateRenderResource{
    NSMutableDictionary *result = [NSMutableDictionary new];
    NSArray *stockModels = [self.stockModels copy];
    CGPoint targetContentOffset = self.targetContentOffset;
    GDChartsConfigModel *configModel = self.configModel;
    
    NSInteger displayStartIndex = [self.calculationModel calcDisplayStartIndexWithConfigModel:configModel models:stockModels offset:targetContentOffset.x];
    NSArray *displayModels = [self.calculationModel subDisplayModelsWithConfigModel:configModel displayStartIndex:displayStartIndex models:stockModels];
    
    NSArray *maxMinPrice = [self.calculationModel maxMinPrice:displayModels];
    NSArray *points = [self.calculationModel calcPositionWithConfigModel:configModel maxMinPrice:maxMinPrice
                                                       displayStartIndex:displayStartIndex offset:targetContentOffset.x displayModels:displayModels];
    
    
    [result setValue:points forKey:@"points"];
    
    if ( [self.delegate respondsToSelector:@selector(updateRenderResource:)] )
        [self.delegate updateRenderResource:result];
}
















- (void)updateTargetContentOffset:(CGPoint)targetContentOffset{
    self.targetContentOffset = targetContentOffset;
    [self updateRenderResource];
}






@end


