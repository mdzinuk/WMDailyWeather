//
//  WMDailyModelnfo.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMModelViewInfo.h"

@protocol WMDailyModelnfo <NSObject, WMModelViewInfo>
@required
- (NSString* )currentTineInfo;
- (NSString* )situtationInfo;
- (NSString* )sunRiseInfo;
- (NSString* )sunsetInfo;

@optional
- (NSString* )precipitatinInfo;
- (NSString* )cloudyCoverInfo;
- (NSString* )humidityInfo;
- (NSString* )dewPointInfo;
- (NSString* )pressureInfo;
- (NSString* )ozoneInfo;
@end
