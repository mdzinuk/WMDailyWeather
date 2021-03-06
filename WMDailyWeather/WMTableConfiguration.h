//
//  WMTableConfiguration.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WMModelViewInfo.h"
#import "WMDailyModelnfo.h"

@interface WMTableConfiguration : NSObject <UITableViewDataSource>
- (instancetype)initWithViewModel:(id<WMModelViewInfo>)viewModel;
- (void)updateDataSourceWithModel:(id<WMModelViewInfo>)viewModel;
@end
