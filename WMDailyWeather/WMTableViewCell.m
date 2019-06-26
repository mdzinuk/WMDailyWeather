//
//  WMTableViewCell.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMTableViewCell.h"
#import "UIFont+WeatherFont.h"
#import "NSString+WeatherFont.h"

@interface WMTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *sunriseLbl;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLbl;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLbl;
@property (weak, nonatomic) IBOutlet UILabel *precipitationLbl;
@property (weak, nonatomic) IBOutlet UILabel *cloudyLbl;
@property (weak, nonatomic) IBOutlet UILabel *humidityLbl;
@property (weak, nonatomic) IBOutlet UILabel *situationLbl;
@property (weak, nonatomic) IBOutlet UILabel *dewPointLbl;
@property (weak, nonatomic) IBOutlet UILabel *pressureLbl;
@property (weak, nonatomic) IBOutlet UILabel *ozoneLbl;
@property (nonatomic, weak) id<WMDailyModelnfo> dataModel;
@end

@implementation WMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.sunriseLbl.font = [UIFont fontWMFontOfSize: 17];
    self.currentTimeLbl.font = [UIFont fontWMFontOfSize:12];
    self.sunsetLbl.font = [UIFont fontWMFontOfSize:17];
    
    
    self.precipitationLbl.font = [UIFont fontWMFontOfSize:17];
    self.cloudyLbl.font = [UIFont fontWMFontOfSize:17];
    self.humidityLbl.font = [UIFont fontWMFontOfSize:17];
    
    
    self.situationLbl.font = [UIFont fontWMFontOfSize:17];
    
    self.dewPointLbl.font = [UIFont fontWMFontOfSize:17];
    self.pressureLbl.font = [UIFont fontWMFontOfSize:17];
    self.ozoneLbl.font = [UIFont fontWMFontOfSize:17];
}

- (void)setModel:(id<WMDailyModelnfo>)model {
    
    
    self.sunriseLbl.text = [NSString stringWithFormat:@"%@ %@", [NSString fontWMIconStringForEnum: wi_sunrise], model.sunRiseInfo];
    self.currentTimeLbl.text = [NSString stringWithFormat:@"%@ %@", [NSString fontWMIconStringForEnum: wi_time_12], model.currentTineInfo];
    self.sunsetLbl.text = [NSString stringWithFormat:@"%@ %@", model.sunsetInfo, [NSString fontWMIconStringForEnum: wi_sunset]];
    
    self.precipitationLbl.text = [NSString stringWithFormat:@"%@ %@", [NSString fontWMIconStringForEnum: wi_day_showers], model.precipitatinInfo];
    self.cloudyLbl.text = [NSString stringWithFormat:@"%@ %@", [NSString fontWMIconStringForEnum: wi_night_partly_cloudy], model.cloudyCoverInfo];
    self.humidityLbl.text = model.humidityInfo;
    
    self.situationLbl.text = [NSString stringWithFormat:@"%@ %@", [NSString fontWMIconStringForEnum: wi_wmo4680_24], model.situtationInfo];
    
    self.dewPointLbl.text = [NSString stringWithFormat:@"%@ %@", [NSString fontWMIconStringForEnum: wi_wu_snow], model.dewPointInfo];
    self.pressureLbl.text = [NSString stringWithFormat:@"%@ %@ %@", [NSString fontWMIconStringForEnum: wi_thermometer], model.pressureInfo, [NSString fontWMIconStringForEnum: wi_thermometer]];
    self.ozoneLbl.text = [NSString stringWithFormat:@"%@ %@", model.ozoneInfo, [NSString fontWMIconStringForEnum: wi_owm_520]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (self.dataModel && [self.dataModel isModelView]) {
    }
}
/*
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.situationLbl setNeedsLayout];
    [self.situationLbl layoutIfNeeded];
}

-(void)didMoveToSuperview {
    [self layoutIfNeeded];
}*/

@end
