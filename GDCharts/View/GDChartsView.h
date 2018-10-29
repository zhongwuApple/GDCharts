//
//  GDChartsView.h
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDChartsConfigModel.h"
#import "GDChartsRender.h"

@interface GDChartsView : UIView<GDChartsRender>

@property (nonatomic, strong) UIScrollView            *scrollView;

- (void)setupWithConfig:(GDChartsConfigModel *)configModel;
































@end


