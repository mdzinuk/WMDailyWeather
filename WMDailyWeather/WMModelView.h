//
//  WMModelView.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMDailyModelView.h"
#import "WMLocationInfo.h"
#import "WMModelViewInfo.h"


@interface WMModelView : NSObject
@property (nonatomic, readonly, strong) NSMutableArray<WMModelViewInfo, WMDailyModelnfo>* dailyModelViews;
- (NSString* )locationName;
- (NSString* )lastUpdate;
- (void)updateWithWMLocation:(id<WMLocationInfo>)location;
@end
