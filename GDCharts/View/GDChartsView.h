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
#import "GDLinecharView.h"
@interface GDChartsView : UIView<GDChartsRender>

@property (nonatomic, strong) UIScrollView            *scrollView;
@property (nonatomic, strong) GDLinecharView          *linecharView;


- (void)updateWithConfigModel:(GDChartsConfigModel *)configModel contentViewRect:(CGRect)arect;
































@end


