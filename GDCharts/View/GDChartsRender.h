//
//  GDChartsRender.h
//  PT
//
//  Created by tiger on 2018/10/22.
//  Copyright © 2018 tiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GDChartsRender <NSObject>

- (void)render:(NSDictionary *)resource;

- (void)clear;

@end
