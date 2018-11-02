//
//  ViewController.m
//  GDCharts
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import "ViewController.h"
#import "GDChartsViewBinder.h"

@interface ViewController ()

@property (nonatomic, strong) GDChartsViewBinder            *chartsView;

@end

@implementation ViewController

- (GDChartsConfigModel *)buildConfigModel{
    GDChartsConfigModel *configModel = [GDChartsConfigModel new];
    return configModel;
}

- (void)addChartsView{
    GDChartsView *aview = [[GDChartsView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 260)];
    self.chartsView = [[GDChartsViewBinder alloc] initWithView:aview];
    GDChartsViewModel *aviewModel = [[GDChartsViewModel alloc] initConfigModel:[self buildConfigModel]];    
    [self.chartsView bindViewModel:aviewModel];
    
    self.chartsView.view.backgroundColor = [UIColor yellowColor];
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChartsView];
    [self.view addSubview:self.chartsView.view];

    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
