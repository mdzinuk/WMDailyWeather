//
//  WMLocation.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "WMLocationInfo.h"

@interface WMLocation : CLLocation <WMLocationInfo>
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)cDinate
                          withCity:(NSString* )city
                        andCountry:(NSString* )country;
@end
