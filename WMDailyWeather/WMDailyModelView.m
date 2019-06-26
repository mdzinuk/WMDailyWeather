//
//  WMDailyModelView.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMDailyModelView.h"
#import "WMModelViewInfo.h"
#import "WMDailyModelnfo.h"

@interface WMDailyModelView() <WMDailyModelnfo>
@property (nonatomic) id<WMDailyModelnfo> model;
@property (nonatomic) WMDailyModel* dailyModel;;
@end


@implementation WMDailyModelView
- (instancetype)initWithDaily:(WMDailyModel* )model
{
    self = [super init];
    if (self != nil) {
        self.dailyModel = model;
        //NSLog(@"==========%@",[(id<WMDailyModelnfo>)self.model currentTineInfo]);
        return (WMDailyModelView*)[self buildModelView:self];
    }
    return self;
}

#pragma mark --
#pragma mark -- <WMModelViewInfo>
- (BOOL)isModelView {
    if ([self conformsToProtocol:@protocol(WMDailyModelnfo)]) {
        return YES;
    }
    return NO;
}
- (id<WMModelViewInfo>)buildModelView:(id)viewModel
{
    if([viewModel isKindOfClass:[WMDailyModelView class]]) {
        self.model = viewModel;
        return self.model;
    }
    return nil;
}
- (NSString* )modelViewName {
    return NSStringFromClass(self.class);
}

- (NSInteger)modelCount
{
    return 0;
}

- (id<NSObject>)modelAtIndex:(NSInteger)index
{
    return nil;
}

- (NSString* )currentTineInfo { return self.dailyModel.time; }
- (NSString* )situtationInfo { return self.dailyModel.summary; }
- (NSString* )sunRiseInfo { return self.dailyModel.sunriseTime; }
- (NSString* )sunsetInfo { return self.dailyModel.sunsetTime; }

- (NSString* )precipitatinInfo { return self.dailyModel.precipType; }
- (NSString* )cloudyCoverInfo { return self.dailyModel.cloudCover.stringValue; }
- (NSString* )humidityInfo { return self.dailyModel.humidity.stringValue; }
- (NSString* )dewPointInfo { return self.dailyModel.dewPoint.stringValue; }
- (NSString* )pressureInfo { return self.dailyModel.pressure.stringValue; }
- (NSString* )ozoneInfo { return self.dailyModel.ozone.stringValue; }
@end

