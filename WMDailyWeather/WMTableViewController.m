//
//  WMDailyWeatherTableViewController.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMTableViewController.h"
#import "WMTableViewCell.h"
#import "WMModelViewInfo.h"
#import "WMModelView.h"
#import "WMLocationManager.h"

#import "WMTableConfiguration.h"

#import "WMDetailViewController.h"

@interface WMTableViewController () <UITableViewDelegate>
@property (nonatomic, strong) WMModelView* viewModel;
@property (nonatomic, strong) WMTableConfiguration* dataSource;
@end

@implementation WMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"WMTableViewCell" bundle:nil] forCellReuseIdentifier:@"TableCell"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 400;
    self.tableView.delegate = self;
    
    [self.tableView setNeedsLayout];
    [self.tableView layoutIfNeeded];
    
    self.viewModel = [[WMModelView alloc] init];
    id modelInfo = (id<WMModelViewInfo>)self.viewModel;
    if([modelInfo isModelView]) {
        self.dataSource = [[WMTableConfiguration alloc] initWithViewModel:modelInfo];
        self.tableView.dataSource = self.dataSource;
        
        [[WMLocationManager sharedLocationManager] getUserSuccessLocation:^(id<WMLocationInfo>location) {
            
            [modelInfo updateWithWMLocation:location didUpdate:^(BOOL updated) {
                NSLog(@" %@------------ %lu",location.description,[modelInfo modelCount]);
                [self.dataSource updateDataSourceWithModel:modelInfo];
                self.title = [location cityName];\
                [self.tableView reloadData];
            }];
        } withFailure:^(CLAuthorizationStatus status, NSString *reason) {
            NSLog(@"reason ..%@", reason);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"WMDetailVC" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(WMTableViewCell* )sender
{
    if ([segue.identifier isEqualToString:@"ShowPet"]) {
        //WMDetailViewController *destinationViewControlller = segue.destinationViewController;
        // self.viewModel = id(<WMDailyModelnfo>) sender.cellModel;
        // destinationViewControlller.viewModel = (id<WMDailyModelnfo>)sender.cellModel;
    }
}

@end
