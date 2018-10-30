//
//  GDChartsViewBinder.h
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDChartsView.h"
#import "GDChartsViewModel.h"
@interface GDChartsViewBinder : NSObject

@property (nonatomic, strong) GDChartsView              *view;
@property (nonatomic, strong) GDChartsViewModel         *viewModel;

- (instancetype)initWithView:(UIView *)aview;

- (void)bindViewModel:(id)aviewmodel;

- (void)viewWillAppear;

@end

