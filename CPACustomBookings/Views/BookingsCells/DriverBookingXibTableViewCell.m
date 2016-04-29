//
//  DriverBookingXibTableViewCell.m
//  CPACustomBookings
//
//  Created by Vlad on 29.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#define HeightWithPercent(heightPercent) (heightPercent*[[UIScreen mainScreen] bounds].size.height)/100
#define WidthWithPercent(widthPercent) (widthPercent*[[UIScreen mainScreen] bounds].size.width)/100

#import "DriverBookingXibTableViewCell.h"
#import "DriverApprovedView.h"
#import "DriverNowView.h"
#import "DriverPendingView.h"
#import "PaxTooLateView.h"
#import "DriverCanceledOrFinishedView.h"

@interface DriverBookingXibTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *mainCell;

@end

@implementation DriverBookingXibTableViewCell {
    DriverApprovedView *approvedView;
    DriverNowView *nowView;
    DriverPendingView *pendingView;
    PaxTooLateView *tooLateView;
    DriverCanceledOrFinishedView *finalView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setCellType:(DriverCellType)cellType {
    [self removeAllSubviews];
//    _cellType = cellType;
    switch (cellType) {
        case DriverCellTypePending:
            
            pendingView = [[NSBundle mainBundle] loadNibNamed:@"DriverPending" owner:self options:nil][0];
            [pendingView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setDriverBuilderView:pendingView];
            [self.mainCell addSubview:pendingView];
            [self addConstraintToView:pendingView];
            
            break;
        case DriverCellTypeApproved:
            
            approvedView = [[NSBundle mainBundle] loadNibNamed:@"DriverApproved" owner:self options:nil][0];
            [approvedView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setDriverBuilderView:approvedView];
            [self.mainCell addSubview:approvedView];
            [self addConstraintToView:approvedView];
            
            break;
        case DriverCellTypeEnRoute:
            
            nowView = [[NSBundle mainBundle] loadNibNamed:@"DriverNow" owner:self options:nil][0];
            [nowView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setDriverBuilderView:nowView];
            [self.mainCell addSubview:nowView];
            [self addConstraintToView:nowView];
            
            break;
        case DriverCellTypeFinished:
        case DriverCellTypeCanceled:
            
            finalView = [[NSBundle mainBundle] loadNibNamed:@"DriverCanceled" owner:self options:nil][0];
            [finalView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setDriverBuilderView:finalView];
            
            if (_cellType == DriverCellTypeFinished)
                [_driverBuilderView setStatus:@"Finished"];
            
            [self.mainCell addSubview:finalView];
            [self addConstraintToView:finalView];
            
            break;
        case DriverCellTypeNoRequest:
            
            tooLateView = [[NSBundle mainBundle] loadNibNamed:@"PaxTooLate" owner:self options:nil][0];
            [tooLateView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self.mainCell addSubview:tooLateView];
            [self addConstraintToView:tooLateView];
            
            break;
            
        default:
            break;
    }
}

- (void)setRideType:(DriverRideToType)rideType {
    id ride;
    if (rideType == DriverRideToTypeHome) {
        ride = [[[NSBundle mainBundle] loadNibNamed:@"HomeToWork" owner:self options:nil] objectAtIndex:0];
        [ride setTranslatesAutoresizingMaskIntoConstraints:NO];
        if (_cellType == DriverCellTypeNoRequest) {
            //            [self settingsRideToViewWithType:rideType];
            //            [rtv setTranslatesAutoresizingMaskIntoConstraints:NO];
            //            [tooLate addSubview:rtv];
            
        } else {
            [[_driverBuilderView getBottomView] addSubview:ride];
        }
        
    } else {
        ride = [[[NSBundle mainBundle] loadNibNamed:@"WorkToHome" owner:self options:nil] objectAtIndex:0];
        [ride setTranslatesAutoresizingMaskIntoConstraints:NO];
        if (_cellType == DriverCellTypeNoRequest) {
            ////            [self settingsRideToViewWithType:rideType];
            ////            [rtv setTranslatesAutoresizingMaskIntoConstraints:NO];
            ////            [tooLate addSubview:rtv];
        } else {
            [[_driverBuilderView getBottomView] addSubview:ride];
        }
    }
    [(UIView *)ride subviews][0].alpha = 0.5;
    [self constraintsForRide:ride];
}


- (void) addConstraintToView:(UIView *)view {
    NSDictionary *views = @{@"subview" : view};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[subview]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[subview]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
}

- (void)constraintsForRide:(id)ride {
    NSDictionary *views = @{@"ride": ride};
    if (_cellType == DriverCellTypeNoRequest) {
        //        [tooLate addConstraint:[NSLayoutConstraint constraintWithItem:rtv
        //                                                            attribute:NSLayoutAttributeCenterX
        //                                                            relatedBy:NSLayoutRelationEqual
        //                                                               toItem:tooLate
        //                                                            attribute:NSLayoutAttributeCenterX
        //                                                           multiplier:1
        //                                                             constant:-58]];
        //        [tooLate addConstraint:[NSLayoutConstraint constraintWithItem:rtv
        //                                                            attribute:NSLayoutAttributeCenterY
        //                                                            relatedBy:NSLayoutRelationEqual
        //                                                               toItem:tooLate
        //                                                            attribute:NSLayoutAttributeCenterY
        //                                                           multiplier:1
        //                                                             constant:-34]];
    } else {
        [[_driverBuilderView getBottomView] addConstraint:[NSLayoutConstraint constraintWithItem:ride
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:[_driverBuilderView getBottomView]
                                                                                 attribute:NSLayoutAttributeCenterX multiplier:1
                                                                                  constant:WidthWithPercent(28)]];
        
        [[_driverBuilderView getBottomView] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[ride]|"
                                                                                             options:0
                                                                                             metrics:nil
                                                                                               views:views]];
    }
}


- (void)removeAllSubviews {
    [approvedView removeFromSuperview];
    [nowView removeFromSuperview];
    [pendingView removeFromSuperview];
    [finalView removeFromSuperview];
    [tooLateView removeFromSuperview];
}

#pragma mark - Setter Methods

- (void)setName:(NSString *)name {
    _driverBuilderView.name = name;
}

- (void)setAvatarURL:(NSURL *)avatarURL {
    
}

- (void)setDate:(NSString *)date {
    _driverBuilderView.date = date;
}

- (void)setDetour:(NSString *)detour {
    _driverBuilderView.detour = detour;
}

- (void)setPrice:(NSString *)price {
    _driverBuilderView.price = price;
}

- (void)setStatus:(NSString *)status {
    _driverBuilderView.status = status;
}

- (void)setDriverBuilderView:(DriverBuilderView *)driverBuilderView {
    _driverBuilderView = driverBuilderView;
}

@end
