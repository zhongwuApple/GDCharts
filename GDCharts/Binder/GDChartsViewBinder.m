//
//  GDChartsViewBinder.m
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "GDChartsViewBinder.h"
#import "GDChartsViewModel.h"


@interface GDChartsViewBinder()<UIScrollViewDelegate, GDChartsViewModelDelegate>



@end

@implementation GDChartsViewBinder


- (instancetype)initWithView:(UIView *)aview
{
    self = [super init];
    if (self) {
        self.view = (GDChartsView *)aview;
        [self setup];
    }
    return self;
}

- (void)bindViewModel:(id)aviewmodel{
    self.viewModel = (GDChartsViewModel *)aviewmodel;
    self.viewModel.delegate = self;
}


- (void)setup{
    self.view.scrollView.delegate = self;
}

- (void)viewWillAppear{
    
    
    
}



#pragma mark delegate

- (void)updateContentView:(CGRect )arect{
    [self.view updateWithConfigModel:self.viewModel.configModel contentViewRect:arect];
}

- (void)updateRenderResource:(NSDictionary *)resource{
    [self.view render:resource];
}


#pragma mark scrollView delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"WillBeginDragging == ---%f", scrollView.contentOffset.x);
//    NSLog(@"start ----");
    
    
    
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSLog(@"scrollViewW  当前contentOffsetX = %f, 加速方向 = %f, targetContentOffsetX = %f", scrollView.contentOffset.x, velocity.x, targetContentOffset->x );
    CGPoint contentOffset = CGPointMake(targetContentOffset->x, targetContentOffset->y);
    [self.viewModel updateTargetContentOffset:contentOffset];
//    NSLog(@"end --");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"****");
//    [self.viewModel updateTargetContentOffset:scrollView.contentOffset];
    
}

















@end

