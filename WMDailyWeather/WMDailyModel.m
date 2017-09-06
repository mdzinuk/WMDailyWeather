//
//  WMDailyModel.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMDailyModel.h"


@interface WMDailyModel()
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@end

@implementation WMDailyModel 
- (NSDateFormatter* )dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [WMDailyModel dateFormatter];
    }
    return _dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"summary"                             : @"summary",
             @"time"                                : @"time",
             @"icon"                                : @"icon",
             @"sunriseTime"                         : @"sunriseTime",
             @"sunsetTime"                          : @"sunsetTime",
             @"moonPhase"                           : @"moonPhase",
             @"precipIntensity"                     : @"precipIntensity",
             @"precipIntensityMax"                  : @"precipIntensityMax",
             @"precipIntensityMaxTime"              : @"precipIntensityMaxTime",
             @"precipProbability"                   : @"precipProbability",
             @"precipType"                          : @"precipType",
             @"temperatureMin"                      : @"temperatureMin",
             @"temperatureMinTime"                  : @"temperatureMinTime",
             @"temperatureMax"                      : @"temperatureMax",
             @"temperatureMaxTime"                  : @"temperatureMaxTime",
             @"apparentTemperatureMin"              : @"apparentTemperatureMin",
             @"apparentTemperatureMinTime"          : @"apparentTemperatureMinTime",
             @"apparentTemperatureMax"              : @"apparentTemperatureMax",
             @"apparentTemperatureMaxTime"          : @"apparentTemperatureMaxTime",
             @"dewPoint"                            : @"dewPoint",
             @"humidity"                            : @"humidity",
             @"windSpeed"                           : @"windSpeed",
             @"windBearing"                         : @"windBearing",
             @"visibility"                          : @"visibility",
             @"cloudCover"                          : @"cloudCover",
             @"pressure"                            : @"pressure",
             @"ozone"                               : @"ozone"
             };
}

+ (NSValueTransformer* )timeJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber* value, BOOL *success, NSError *__autoreleasing *error) {
        return [WMDailyModel dateStringFormat:[NSDate dateWithTimeIntervalSince1970:value.doubleValue]];
    }];
}
+ (NSValueTransformer* )sunriseTimeJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber* value, BOOL *success, NSError *__autoreleasing *error) {
        return [WMDailyModel timeStringFormat:[NSDate dateWithTimeIntervalSince1970:value.doubleValue]];
    }];
}

+ (NSValueTransformer* )sunsetTimeJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber* value, BOOL *success, NSError *__autoreleasing *error) {
        return [WMDailyModel timeStringFormat:[NSDate dateWithTimeIntervalSince1970:value.doubleValue]];
    }];
}

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterLongStyle];
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        formatter.timeZone = [NSTimeZone localTimeZone];
        [formatter setLocale:[NSLocale currentLocale]];
    });
    return formatter;
}

+ (NSString* )dateStringFormat:(NSDate* )date {
    [self.dateFormatter setDateFormat:@"dd. MMMM YYYY @hh:mma"];
    [self.dateFormatter stringFromDate:date];
    return [self.dateFormatter stringFromDate:date];
}

+ (NSString* )timeStringFormat:(NSDate* )date {
    self.dateFormatter.timeStyle = NSDateFormatterFullStyle;
    self.dateFormatter.AMSymbol = @"AM";
    self.dateFormatter.PMSymbol = @"PM";
    [self.dateFormatter setDateFormat:@"h:mm a"];
    [self.dateFormatter stringFromDate:date];
    return [self.dateFormatter stringFromDate:date];
}


//+ (NSDateFormatter *)dateFormatter {
//    NSDateFormatter* dateFormatter = [NSDateFormatter new];
//    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
//    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
//    dateFormatter.timeZone = [NSTimeZone localTimeZone];
//    [dateFormatter setLocale:[NSLocale currentLocale]];
//    [dateFormatter setDateFormat:@"dd. MMMM YYYY @hh:mma"];
//    return dateFormatter;
//}



+ (NSArray* )getJson:(NSArray* )myarray
{
   // NSLog(@"%@", [MTLJSONAdapter modelsOfClass:WMDailyModel.class fromJSONArray:myarray error:nil]);
    return [MTLJSONAdapter modelsOfClass:WMDailyModel.class fromJSONArray:myarray error:nil];
}
@end

