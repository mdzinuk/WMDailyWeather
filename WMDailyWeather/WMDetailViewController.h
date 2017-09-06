//
//  WMDetailViewController.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 10/18/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMDailyModelnfo.h"

@interface WMDetailViewController : UIViewController
@property (nonatomic) id<WMDailyModelnfo> viewModel;
@end
