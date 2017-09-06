//
//  WMTableViewCell.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMTableViewCell.h"

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

@end

/*
 - (NSString* )currentTineInfo;
 - (NSString* )situtationInfo;
 - (NSString* )sunRiseInfo;
 - (NSString* )sunsetInfo;
 
 @optional
 - (NSString* )precipitatinInfo;
 - (NSString* )cloudyCoverInfo;
 - (NSString* )humidityInfo;
 - (NSString* )dewPointInfo;
 - (NSString* )pressureInfo;
 - (NSString* )ozoneInfo;
 */

@implementation WMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
     [self layoutIfNeeded];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    //NSLog(@"-------%@",[self.cellModel class]);
    //id <WMDailyModelnfo>model = (id <WMDailyModelnfo>)self.cellModel;
    if (self.cellModel && [self.cellModel isModelView]) {
                
        self.sunriseLbl.text = self.cellModel.sunRiseInfo;
        self.currentTimeLbl.text = self.cellModel.currentTineInfo;
        self.sunsetLbl.text = self.cellModel.sunsetInfo;
        
        self.precipitationLbl.text = self.cellModel.precipitatinInfo;
        self.cloudyLbl.text = self.cellModel.cloudyCoverInfo;
        self.humidityLbl.text = self.cellModel.humidityInfo;
        
        self.situationLbl.text = @"Thiss is arafat hossain and he came from bangladesh please well come to him ";//self.cellModel.situtationInfo;
        
        self.dewPointLbl.text = self.cellModel.dewPointInfo;
        self.pressureLbl.text = self.cellModel.pressureInfo;
        self.ozoneLbl.text = self.cellModel.ozoneInfo;
        
    }
    
    
    
   
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.situationLbl setNeedsLayout];
    [self.situationLbl layoutIfNeeded];
}

-(void)didMoveToSuperview {
    [self layoutIfNeeded];
}

@end
