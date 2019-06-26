//
//  WMTableViewCell.h
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMDailyModelnfo.h"
#import "WMModelViewInfo.h"


@interface WMTableViewCell : UITableViewCell
- (void)setModel:(id<WMDailyModelnfo>)model;
@end
