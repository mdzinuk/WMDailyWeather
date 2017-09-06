//
//  WMDetailViewController.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 10/18/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMDetailViewController.h"

@interface WMDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *sunriseLbl;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLbl;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLbl;
@property (weak, nonatomic) IBOutlet UILabel *precipitationLbl;
@property (weak, nonatomic) IBOutlet UILabel *cloudyLbl;
@property (weak, nonatomic) IBOutlet UILabel *situationLbl;
@property (weak, nonatomic) IBOutlet UILabel *humidityLbl;
@property (weak, nonatomic) IBOutlet UILabel *dewPointLbl;

@end

@implementation WMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"-----------%@",self.viewModel);
    
    self.sunriseLbl.text = self.viewModel.sunRiseInfo;
    self.currentTimeLbl.text = self.viewModel.currentTineInfo;
    self.sunsetLbl.text = self.viewModel.sunsetInfo;
    
    self.precipitationLbl.text = self.viewModel.precipitatinInfo;
    self.cloudyLbl.text = self.viewModel.cloudyCoverInfo;
    self.humidityLbl.text = self.viewModel.humidityInfo;
    
    self.situationLbl.text = self.viewModel.situtationInfo;
    
    self.dewPointLbl.text = self.viewModel.dewPointInfo;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
