//
//  PassengerBookingViewController.m
//  carpoolarabia_ios
//
//  Created by Admin on 16/11/15.
//  Copyright © 2015 gritsay. All rights reserved.
//
#define kBookingCell @"pasangerBooking"
#define kDriverBookingCell @"driverBooking"

#import "PassengerBookingXibViewController.h"
#import "PassengerBookingXibTableViewCell.h"
#import "DriverBookingXibTableViewCell.h"

@interface PassengerBookingXibViewController ()

@end

@implementation PassengerBookingXibViewController {
    UITableView *tv;
    NSArray *arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tv = [[UITableView alloc] initWithFrame:self.view.frame];
    tv.delegate = self;
    tv.dataSource = self;
    [tv setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:tv];
    [tv registerNib:[UINib nibWithNibName:@"PaxMainBook" bundle:nil] forCellReuseIdentifier:kBookingCell];
    [tv registerNib:[UINib nibWithNibName:@"DriverMainBook" bundle:nil] forCellReuseIdentifier:kDriverBookingCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PassengerBookingXibTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBookingCell];
    
    [cell setCellType:(PassengerCellType)indexPath.row];
    [cell setRideType:indexPath.row % 2];
    
    cell.name = @"Vlad";
    cell.isFavorite = indexPath.row % 2;
    cell.date = @"19:30 - 21:00";
    cell.price = @"30";
    
    
    return cell;
//    DriverBookingXibTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDriverBookingCell];
//    
//    [cell setCellType:(DriverCellType)indexPath.row];
//    [cell setRideType:indexPath.row % 2];
//    cell.date = @"19:30 - 21:00";
//    cell.detour = @"15";
//    cell.price = @"30";
//    cell.name = @"Vlad";
//    
//    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


@end
