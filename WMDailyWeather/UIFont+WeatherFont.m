//
//  UIFont+WeatherFont.m
//  WMDailyWeather
//
//  Created by Mohammad Arafat Hossain on 26/06/19.
//  Copyright © 2019 Arafat Hossain. All rights reserved.
//

#import "UIFont+WeatherFont.h"
#import "NSString+WeatherFont.h"

@implementation UIFont (WeatherFont)
+ (UIFont*)fontWMFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:kWMIconFamilyName size:size];
    NSAssert(font!=nil, @"%@ couldn't be loaded",kWMIconFamilyName);
    return font;
}

@end
