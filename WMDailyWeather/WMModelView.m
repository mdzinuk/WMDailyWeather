//
//  WMModelView.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMModelView.h"
#import "WMDataProviderClient.h"
#import "WMModelViewInfo.h"




@interface WMModelView() <WMModelViewInfo>
@property (nonatomic, readwrite, strong) NSMutableArray<WMModelViewInfo, WMDailyModelnfo>* dailyModelViews;
@property (nonatomic, weak) id<WMLocationInfo> currentLocation;
@end

@implementation WMModelView

- (instancetype)init {
    self  = [super init];
    if (self) {
        return [self buildModelView:self];
    }
    return self;
}
- (void)updateWithWMLocation:(id<WMLocationInfo>)location didUpdate:(DidFinishUpdate)didFinish
{
    self.currentLocation = location;
    [[WMDataProviderClient sharedWMDataProviderClient] requestWith:location response:^(NSArray<WMModelViewInfo, WMDailyModelnfo>* models) {
       // NSLog(@"-------(%.2f, %.2f)",location.locationCoordinate.latitude,location.locationCoordinate.longitude);
        if (self.dailyModelViews.count) [self.dailyModelViews removeAllObjects];
        [self.dailyModelViews addObjectsFromArray:models];
        didFinish(YES);
    }];
}

- (NSMutableArray* )dailyModelViews {
    if (_dailyModelViews == nil) {
        _dailyModelViews = [NSMutableArray<WMModelViewInfo, WMDailyModelnfo> new];
    }
    
    return _dailyModelViews;
}
- (NSString* )locationName
{
    return [NSString stringWithFormat:@"%@, %@", self.currentLocation.cityName, self.currentLocation.countryName];
}
- (NSString* )lastUpdate
{
    return self.currentLocation.lastUpdate;
}


#pragma mark --
#pragma mark -- <WMModelViewInfo>
- (BOOL)isModelView {
    if ([self conformsToProtocol:@protocol(WMModelViewInfo)]) {
        return YES;
    }
    return NO;
}
- (id<WMModelViewInfo>)buildModelView:(id)viewModel
{
    if([viewModel isKindOfClass:[WMModelView class]]) {
        id<WMModelViewInfo> model = viewModel;
        return model;
    }
    return nil;
}
- (NSString* )modelViewName {
    return NSStringFromClass(self.class);
}

- (NSInteger)modelCount
{
    //NSLog(@"%lu,", self.dailyModelViews.count);
    return self.dailyModelViews.count;
}
- (id<NSObject>)modelAtIndex:(NSInteger)index
{
    if (index< self.modelCount && index>0 ) {
        return self.dailyModelViews[index];
    }
    return nil;
}
@end
