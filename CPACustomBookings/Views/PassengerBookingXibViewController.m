//
//  PassengerBookingViewController.m
//  carpoolarabia_ios
//
//  Created by Admin on 16/11/15.
//  Copyright © 2015 gritsay. All rights reserved.
//
#define kBookingCell @"pasangerBooking"

#import "PassengerBookingXibViewController.h"
#import "PassengerBookingXibTableViewCell.h"

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
    [tv registerNib:[UINib nibWithNibName:@"MainBook" bundle:nil] forCellReuseIdentifier:kBookingCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PassengerBookingXibTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBookingCell];
    
    [cell setCellType:(PassengerCellType)indexPath.row];
    [cell setRideType:indexPath.row % 2];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


@end
