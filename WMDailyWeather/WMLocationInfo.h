//
//  WMLocationInfo.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol WMLocationInfo <NSObject>
@required
@property (readonly, nonatomic) CLLocationCoordinate2D locationCoordinate;

@optional
- (NSString* )cityName;
- (NSString* )countryName;
- (NSString* )lastUpdate;
@end
