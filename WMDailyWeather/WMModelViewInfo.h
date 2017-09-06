//
//  WMModelViewInfo.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WMModelViewInfo <NSObject>
@required
- (BOOL)isModelView;
- (id<WMModelViewInfo>)buildModelView:(id)viewModel;

@optional
- (NSString* )modelViewName;
- (NSInteger)modelCount;
- (id<NSObject>)modelAtIndex:(NSInteger)index;
@end
