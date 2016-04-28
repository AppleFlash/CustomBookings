//
//  PassengerBookingTableViewCell.h
//  carpoolarabia_ios
//
//  Created by Admin on 16/11/15.
//  Copyright © 2015 gritsay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassengerBookingXibViewController.h"
#import "BuilderButtomView.h"

typedef enum {
    PassengerCellTypeFindDriver,
    PassengerCellTypePending,
    PassengerCellTypeApproved,
    PassengerCellTypeEnRoute,
    PassengerCellTypeFinished,
    PassengerCellTypeCanceled,
    PassengerCellTypeTooLate
} PassengerCellType;

typedef enum {
    RideToTypeWork,
    RideToTypeHome
} RideToType;

@interface PassengerBookingXibTableViewCell : UITableViewCell

@property (nonatomic, strong) BuilderButtomView *builderBottomView;
@property (nonatomic, assign) PassengerCellType cellType;
@property (nonatomic, assign) RideToType rideType;

@end
