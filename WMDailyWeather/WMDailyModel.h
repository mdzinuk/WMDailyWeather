//
//  WMDailyModel.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "WMDailyModelnfo.h"

@interface WMDailyModel: MTLModel <MTLJSONSerializing>
@property (nonatomic, copy) NSString* time;
@property (nonatomic,   copy) NSString* summary;
@property (nonatomic,   copy) NSString* icon;

@property (nonatomic, strong) NSNumber* dewPoint;
@property (nonatomic, strong) NSNumber* humidity;
@property (nonatomic, strong) NSNumber* windSpeed;
@property (nonatomic, strong) NSNumber* windBearing;
@property (nonatomic, strong) NSNumber* visibility;
@property (nonatomic, strong) NSNumber* cloudCover;
@property (nonatomic, strong) NSNumber* pressure;
@property (nonatomic, strong) NSNumber* ozone;

@property (nonatomic, strong) NSNumber* precipIntensity;



@property (nonatomic, copy) NSString* sunriseTime;
@property (nonatomic, copy) NSString* sunsetTime;
@property (nonatomic, strong) NSNumber* moonPhase;



@property (nonatomic, strong) NSNumber* precipIntensityMax;
@property (nonatomic, strong) NSNumber* precipIntensityMaxTime;
@property (nonatomic, strong) NSNumber* precipProbability;
@property (nonatomic,   copy) NSString* precipType;

@property (nonatomic, strong) NSNumber* temperatureMin;
@property (nonatomic, strong) NSNumber* temperatureMinTime;
@property (nonatomic, strong) NSNumber* temperatureMax;
@property (nonatomic, strong) NSNumber* temperatureMaxTime;
@property (nonatomic, strong) NSNumber* apparentTemperatureMin;
@property (nonatomic, strong) NSNumber* apparentTemperatureMinTime;
@property (nonatomic, strong) NSNumber* apparentTemperatureMax;
@property (nonatomic, strong) NSNumber* apparentTemperatureMaxTime;
+ (NSArray* )getJson:(NSArray* )myarray;

@end

