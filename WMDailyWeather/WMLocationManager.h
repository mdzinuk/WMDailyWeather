//
//  WMLocationManager.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMLocationInfo.h"
#import <CoreLocation/CoreLocation.h>

typedef void (^SuccessLocation)(id<WMLocationInfo>);
typedef void (^FailureLocation)(CLAuthorizationStatus, NSString*);

@interface WMLocationManager : NSObject
+ (WMLocationManager* )sharedLocationManager;
- (void)getUserSuccessLocation:(SuccessLocation)success withFailure:(FailureLocation)failure;
@end
