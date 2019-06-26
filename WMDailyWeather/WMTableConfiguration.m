//
//  WMTableConfiguration.m
//  WMDailyWeather
//
//  Created by Arafat Hossain on 9/27/16.
//  Copyright © 2016 Arafat Hossain. All rights reserved.
//

#import "WMTableConfiguration.h"
#import "WMTableViewCell.h"
#import "WMDailyModelnfo.h"



@interface WMTableConfiguration()
@property (nonatomic, weak) id<WMModelViewInfo> viewModel;
@end


@implementation WMTableConfiguration
- (instancetype)initWithViewModel:(id<WMModelViewInfo>)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}
- (void)updateDataSourceWithModel:(id<WMModelViewInfo>)viewModel {
    self.viewModel = viewModel;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // return self.viewModel.count;
    return self.viewModel.modelCount;
}

- (WMTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    [cell setModel: (id<WMDailyModelnfo>)[self.viewModel modelAtIndex:indexPath.row]];
    return cell;
}

@end
