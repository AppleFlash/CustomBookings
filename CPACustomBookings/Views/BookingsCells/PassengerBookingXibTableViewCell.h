//
//  PassengerBookingTableViewCell.h
//  carpoolarabia_ios
//
//  Created by Admin on 16/11/15.
//  Copyright © 2015 gritsay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuilderView.h"

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

@property (nonatomic, strong) BuilderView *builderView;
@property (nonatomic, assign) PassengerCellType cellType;
@property (nonatomic, assign) RideToType rideType;

@property (strong, nonatomic) NSURL *avatarURL;
//@property (weak, nonatomic) UIImageView *priceImage;
@property (assign, nonatomic) BOOL isFavorite;
@property (assign, nonatomic) float rating;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *name;

@end
