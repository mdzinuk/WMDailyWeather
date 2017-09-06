//
//  WMDailyModelView.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMDailyModelnfo.h"
#import "WMModelViewInfo.h"

#import "WMDailyModel.h"

@interface WMDailyModelView : NSObject
- (instancetype)initWithDaily:(WMDailyModel* )model;
@end
