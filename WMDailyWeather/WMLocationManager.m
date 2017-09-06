//
//  WMLocationManager.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMLocationManager.h"
#import "WMLocation.h"

@interface WMLocationManager() <CLLocationManagerDelegate>
@property (strong, nonatomic, readwrite) CLLocationManager *locationManager;
@property (strong, nonatomic, readwrite) CLGeocoder * geoCoder;
@property (copy, nonatomic, readwrite) SuccessLocation successBlock;
@property (copy, nonatomic, readwrite) FailureLocation failureBlock;
@end

@implementation WMLocationManager
+ (WMLocationManager* )sharedLocationManager {
    
    static WMLocationManager* instantManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instantManager = [[self alloc]init];
    });
    return instantManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 100; // meters
        self.locationManager.delegate = self;
        
        self.geoCoder = [[CLGeocoder alloc] init];
    }
    return self;
}

- (void)getUserSuccessLocation:(SuccessLocation)success withFailure:(FailureLocation)failure {
    self.successBlock = success;
    self.failureBlock = failure;
    
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusAuthorizedAlways:
            [self.locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusNotDetermined:
            [self.locationManager requestAlwaysAuthorization];
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
            //Background Location Access Disabled
            //In order to be notified about adorable kittens near you, please open this app's settings and set location access to 'Always'.
            self.failureBlock([CLLocationManager authorizationStatus], @"Background Location Access Disabled");
            break;
        default:
            break;
    }
}

#pragma mark -- CLLocation Manager delegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [manager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    self.failureBlock(kCLAuthorizationStatusAuthorizedAlways, [NSString stringWithFormat:@"Location Service failed with error %@", error.localizedDescription]);
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray*)locations
{
    CLLocation *location = [locations lastObject];
    
    [self.geoCoder reverseGeocodeLocation:location
                        completionHandler:^(NSArray *placemarks, NSError *error) {
                            if (placemarks.count > 0) {
                                CLPlacemark *placemark = [placemarks objectAtIndex:0];
                                id <WMLocationInfo> locationInfo = [[WMLocation alloc] initWithCoordinate:location.coordinate
                                                                                    withCity:[placemark locality]
                                                                                  andCountry:placemark.country];
                                self.successBlock(locationInfo);
                            }
                        }];
}

@end
