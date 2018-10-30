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

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSLog(@"wp = %f, %f, %f, %f", scrollView.contentOffset.x, velocity.x, targetContentOffset->x, targetContentOffset->y );
//    CGPoint offset = CGPointMake(targetContentOffset->x, 0);
//    [self.viewModel updateContentOffset:scrollView.contentOffset];
//    [self.viewModel updateContentOffset:offset];
}





















@end

