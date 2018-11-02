//
//  GDLinecharView.m
//  GDCharts
//
//  Created by tiger on 2018/10/29.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDLinecharView.h"
#import "GDLinecharModel.h"

@interface GDLinecharView()
@property (nonatomic, strong) UIBezierPath      *oldPath;
@end

@implementation GDLinecharView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup{
    [self.layer addSublayer:self.lineLayer];
    
}


- (CAShapeLayer *)lineLayer{
    if (!_lineLayer) {
        CAShapeLayer *alayer = [CAShapeLayer layer];
        alayer.lineWidth = 2.0;
        alayer.strokeColor = [UIColor greenColor].CGColor;        
        alayer.fillColor = [UIColor clearColor].CGColor;
        _lineLayer = alayer;
    }
    return _lineLayer;
}






#pragma mark 渲染图层

- (void)render:(NSDictionary *)resource{
    NSArray *points = [resource valueForKey:@"points"];
    
    GDLinecharModel *firstPoint = points.firstObject;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:firstPoint.position];
    for (NSInteger index=1; index<points.count; index++) {
        GDLinecharModel *amodel = points[index];
        [path addLineToPoint:amodel.position];
    }
    
//    self.lineLayer.path = path.CGPath;
    
    {
        CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        pathAnimation.fromValue = (__bridge id)[self.oldPath CGPath];
        pathAnimation.toValue = (__bridge id)[path CGPath];
//        pathAnimation.duration = self.aniDuration;
        pathAnimation.duration = 0.8;
        pathAnimation.removedOnCompletion = NO;
        pathAnimation.fillMode = kCAFillModeForwards;
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.lineLayer addAnimation:pathAnimation forKey:@"animationKey"];
        
        self.oldPath = path;
    }
    
    
}



- (void)clear{
    
}






























@end




