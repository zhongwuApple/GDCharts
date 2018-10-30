//
//  GDChartsView.m
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDChartsView.h"

#import "GDBackGroundView.h"

@interface GDChartsView()

@property (nonatomic, strong) GDBackGroundView                  *bgView;



@end

@implementation GDChartsView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup{
    [self addSubview:self.scrollView];
    [self addSubview:self.linecharView];
    
    
}



- (void)updateWithConfigModel:(GDChartsConfigModel *)configModel contentViewRect:(CGRect)arect{
    [self.scrollView setContentSize:arect.size];
    self.scrollView.contentOffset = arect.origin;
    self.linecharView.frame = CGRectMake(0, 0, configModel.chartsWidth, configModel.chartsHeight);
}


- (void)render:(NSDictionary *)resource{
    [self.bgView render:resource];
    
}




- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    return _scrollView;
}


- (GDBackGroundView *)bgView{
    if (!_bgView) {
        _bgView = [[GDBackGroundView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    }
    return _bgView;
}


- (GDLinecharView *)linecharView{
    if (!_linecharView) {
        _linecharView = [GDLinecharView new];
        _linecharView.backgroundColor = [UIColor orangeColor];
        _linecharView.userInteractionEnabled = NO;
    }
    return _linecharView;
}



































@end



