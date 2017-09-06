//
//  WMDataProviderClient.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMDataProviderClient.h"
#import "WMModelViewInfo.h"
#import "WMDailyModelView.h"

static NSString* baseURL = @"https://api.forecast.io";
static NSString* APIKey  = @"38574ea6c3552b51341a36035c696477";

static NSString* serviceURL(id <WMLocationInfo> model) {
    return [NSString stringWithFormat:@"forecast/%@/%lf,%lf",APIKey, model.locationCoordinate.latitude, model.locationCoordinate.longitude];
}

@implementation WMDataProviderClient
+ (WMDataProviderClient* )sharedWMDataProviderClient {
    
    static WMDataProviderClient* instantManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instantManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    });
    return instantManager;
}

- (void)requestWith:(id<WMLocationInfo>)model response:(void (^)(NSArray<WMModelViewInfo, WMDailyModelnfo>*))completion;
{
    [self GET:serviceURL(model) parameters:nil completion:^(OVCResponse * _Nullable response, NSError * _Nullable error) {
        // NSLog(@"==========%@  %@",[response.result objectForKey:@"daily"], error);
        
        NSArray* jsonArray = [[response.result objectForKey:@"daily"] objectForKey:@"data"];
        completion([self getViewModels:[WMDailyModel getJson:jsonArray]]);
        
    }];
    
}

- (NSArray<WMModelViewInfo, WMDailyModelnfo>*)getViewModels:(NSArray<WMDailyModel*>*)models {
    NSMutableArray* array = [NSMutableArray new];
    for (WMDailyModel* model in models) {
        id<WMModelViewInfo, WMDailyModelnfo> info = (id<WMModelViewInfo, WMDailyModelnfo>)[[WMDailyModelView alloc] initWithDaily:model];
        [array addObject:info];
    }
    return array.mutableCopy;
}

+ (NSDictionary *)modelClassesByResourcePath {
    return @{
             @"daily/*": @{
                     @"data/*": [WMDailyModel class]
                     }
             };
}

@end

