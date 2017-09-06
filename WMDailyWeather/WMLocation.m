//
//  WMLocation.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMLocation.h"


@interface WMLocation()
@property (nonatomic, copy) NSString* cityName;
@property (nonatomic, copy) NSString* country;
@property (nonatomic, assign) CLLocationCoordinate2D localCoordinate;
@end


@implementation WMLocation
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)cDinate
                          withCity:(NSString* )city
                        andCountry:(NSString* )country
{
    self = [super init];
    if (self != nil) {
        self.localCoordinate = cDinate;
        _cityName = city;
        _country  = country;
    }
    return self;
}

#pragma mark --
#pragma mark --  <WMLocationProtocol>
- (CLLocationCoordinate2D)locationCoordinate {
    return self.localCoordinate;
}

- (NSString* )countryName
{
    if (_country.length > 0) {
        return _country;
    }
    return @"Unknown Country";
}

- (NSString* )cityName
{
    if (_cityName.length > 0) {
        return _cityName;
    }
    return @"Unknown City";
}
- (NSString* )lastUpdate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd '@'hh:mm a"];
    return[dateFormatter stringFromDate:[NSDate date]];
}
@end
