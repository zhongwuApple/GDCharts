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

@property (nonatomic, strong) GDChartsViewModel         *viewModel;

@end

@implementation GDChartsViewBinder


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setViewModel:(id)aviewmodel{
    _viewModel = (GDChartsViewModel *)aviewmodel;
    _viewModel.delegate = self;
}



- (void)setup{
    self.view.scrollView.delegate = self;
        
}






#pragma mark delegate
- (void)updateRenderResource:(NSDictionary *)resource{
    [self.view render:resource];
}


#pragma mark scrollView delegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSLog(@"wp = %f, %f, %f, %f", scrollView.contentOffset.x, velocity.x, targetContentOffset->x, targetContentOffset->y );
//    CGPoint offset = CGPointMake(targetContentOffset->x, 0);
//    [self.viewModel updateContentOffset:scrollView.contentOffset];
//    [self.viewModel updateContentOffset:offset];
}





















@end

