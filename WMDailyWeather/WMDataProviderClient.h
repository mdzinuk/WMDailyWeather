//
//  WMDataProviderClient.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Overcoat/Overcoat.h>
#import "WMLocationInfo.h"
#import "WMDailyModel.h"
#import "WMModelViewInfo.h"
#import "WMDailyModelnfo.h"


@interface WMDataProviderClient : OVCHTTPSessionManager
+ (WMDataProviderClient* )sharedWMDataProviderClient;
- (void)requestWith:(id<WMLocationInfo>)model response:(void (^)(NSArray<WMModelViewInfo, WMDailyModelnfo>*))completion;
@end
