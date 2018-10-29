//
//  GDBackGroundView.m
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDBackGroundView.h"


#import "GDChartsConfigModel.h"

#import "GDChartsGridModel.h"

@interface GDBackGroundView()

@property (nonatomic, strong) CAShapeLayer                      *verticalLineLayer;
@property (nonatomic, strong) CAShapeLayer                      *horizontalLineLayer;

@end

@implementation GDBackGroundView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setup{
    
    [self.layer addSublayer:self.verticalLineLayer];
//    [self.layer addSublayer:self.horizontalLineLayer];
    
}


- (void)render:(NSDictionary *)resource{
//    [self.horizontalLineLayer render:resource];
//    [self.verticalLineLayer render:resource];
    
    [self renderVerticalLineLayer:resource];
}


- (void)renderVerticalLineLayer:(NSDictionary *)resource{
    
    GDChartsConfigModel *configModel = [resource valueForKey:@"GDChartsConfigModel"];
    NSArray *timeModels = [resource valueForKey:@"TimeModels"];    
    CGFloat viewHeight = configModel.chartsHeight;
    NSInteger count = timeModels.count;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for(NSInteger index=0; index<count; index++ ){
        GDChartsGridModel *amodel = [timeModels objectAtIndex:index];
        [path moveToPoint:CGPointMake(amodel.offsetx, 0)];
        [path addLineToPoint:CGPointMake(amodel.offsetx, viewHeight)];
    }
    
    self.verticalLineLayer.path = path.CGPath;
    
}

- (void)renderHorizontalLineLayer:(NSDictionary *)resource{
    
}







- (CAShapeLayer *)horizontalLineLayer{
    if (!_horizontalLineLayer) {
        CAShapeLayer *alayer = [CAShapeLayer layer];
        alayer.lineWidth = 0.5;
        alayer.lineJoin = kCALineJoinRound;
        alayer.lineDashPattern = @[@(3),@(3)];
        
//        alayer.strokeColor = [UIColor nm_colorFromRGB:0x464d61].CGColor;
        //        alayer.fillColor = [UIColor yellowColor].CGColor;
        _horizontalLineLayer = alayer;
    }
    return _horizontalLineLayer;
}

- (CAShapeLayer *)verticalLineLayer{
    if (!_verticalLineLayer) {
        CAShapeLayer *alayer = [CAShapeLayer layer];
        alayer.lineWidth = 0.5;
        alayer.lineJoin = kCALineJoinRound;
        alayer.lineDashPattern = @[@(3),@(3)];
        
//        alayer.strokeColor = [UIColor nm_colorFromRGB:0x464d61].CGColor;
        //        alayer.fillColor = [UIColor yellowColor].CGColor;
        _verticalLineLayer = alayer;
    }
    return _verticalLineLayer;
}



















@end







