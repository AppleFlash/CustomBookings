//
//  DriverBookingXibTableViewCell.h
//  CPACustomBookings
//
//  Created by Vlad on 29.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import "DriverBuilderView.h"

typedef enum{
    DriverCellTypePending,
    DriverCellTypeApproved,
    DriverCellTypeFinished,
    DriverCellTypeCanceled,
    DriverCellTypeEnRoute,
    DriverCellTypeNoRequest
} DriverCellType;

typedef enum {
    DriverRideToTypeWork,
    DriverRideToTypeHome
} DriverRideToType;

@interface DriverBookingXibTableViewCell : UITableViewCell

@property (nonatomic, strong) DriverBuilderView *driverBuilderView;
@property (nonatomic, assign) DriverCellType cellType;
@property (nonatomic, assign) DriverRideToType rideType;

@property (strong, nonatomic) NSURL *avatarURL;
//@property (weak, nonatomic) UIImageView *priceImage;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *detour;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *status;

@end
