//
//  PassengerBookingTableViewCell.m
//  carpoolarabia_ios
//
//  Created by Admin on 16/11/15.
//  Copyright © 2015 gritsay. All rights reserved.
//

#define HeightWithPercent(heightPercent) (heightPercent*[[UIScreen mainScreen] bounds].size.height)/100
#define WidthWithPercent(widthPercent) (widthPercent*[[UIScreen mainScreen] bounds].size.width)/100

#import "PassengerBookingXibTableViewCell.h"
#import "PaxApprovedView.h"
#import "PaxNowView.h"
#import "PaxPendingView.h"
#import "PaxRequestToView.h"
#import "PaxTooLateView.h"
#import "PaxCanceledOrFinishedView.h"

@interface PassengerBookingXibTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *mainCell;

@end

@implementation PassengerBookingXibTableViewCell {
    PaxApprovedView *approvedView;
    PaxNowView *nowView;
    PaxPendingView *pendingView;
    PaxRequestToView *requestView;
    PaxTooLateView *tooLateView;
    PaxCanceledOrFinishedView *finalView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setCellType:(PassengerCellType)cellType {
    [self removeAllSubviews];
    _cellType = cellType;
    switch (cellType) {
        case PassengerCellTypeFindDriver:
            
            requestView = [[NSBundle mainBundle] loadNibNamed:@"PaxRequestTo" owner:self options:nil][0];
            [requestView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setBuilderBottomView:requestView];
            [self.mainCell addSubview:requestView];
            [self addConstraintToView:requestView];
            break;
            
        case PassengerCellTypePending:
            
            pendingView = [[NSBundle mainBundle] loadNibNamed:@"PaxPending" owner:self options:nil][0];
            [pendingView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setBuilderBottomView:pendingView];
            [self.mainCell addSubview:pendingView];
            [self addConstraintToView:pendingView];
            
            break;
        case PassengerCellTypeApproved:
            
            approvedView = [[NSBundle mainBundle] loadNibNamed:@"PaxApproved" owner:self options:nil][0];
            [approvedView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setBuilderBottomView:approvedView];
            [self.mainCell addSubview:approvedView];
            [self addConstraintToView:approvedView];
            
            break;
        case PassengerCellTypeEnRoute:
            
            nowView = [[NSBundle mainBundle] loadNibNamed:@"PaxNow" owner:self options:nil][0];
            [nowView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setBuilderBottomView:nowView];
            [self.mainCell addSubview:nowView];
            [self addConstraintToView:nowView];
            
            break;
        case PassengerCellTypeFinished:
        case PassengerCellTypeCanceled:
            
            finalView = [[NSBundle mainBundle] loadNibNamed:@"PaxCanceledOrFinished" owner:self options:nil][0];
            [finalView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self setBuilderBottomView:finalView];
            
            if (_cellType == PassengerCellTypeFinished)
                [_builderView setStatus:@"Finished"];
            
            [self.mainCell addSubview:finalView];
            [self addConstraintToView:finalView];
            
            break;
        case PassengerCellTypeTooLate:
            
            tooLateView = [[NSBundle mainBundle] loadNibNamed:@"PaxTooLate" owner:self options:nil][0];
            [tooLateView setTranslatesAutoresizingMaskIntoConstraints:NO];
            [self.mainCell addSubview:tooLateView];
            [self addConstraintToView:tooLateView];
            
            break;
            
        default:
            break;
    }
}

- (void)setRideType:(RideToType)rideType {
    id ride;
    if (rideType == RideToTypeHome) {
        ride = [[[NSBundle mainBundle] loadNibNamed:@"HomeToWork" owner:self options:nil] objectAtIndex:0];
        [ride setTranslatesAutoresizingMaskIntoConstraints:NO];
        if (_cellType == PassengerCellTypeTooLate) {
//            [self settingsRideToViewWithType:rideType];
//            [rtv setTranslatesAutoresizingMaskIntoConstraints:NO];
//            [tooLate addSubview:rtv];
            
        } else if (_cellType == PassengerCellTypeFindDriver) {
//            [self settingsRideToViewWithType:rideType];
//            [rtv setTranslatesAutoresizingMaskIntoConstraints:NO];
//            [fdv.findDriverButton setTitle:@"REQUEST A RIDE TO WORK" forState:UIControlStateNormal];
//            [fdv.timeInterval setText:[NSString stringWithFormat:@"%@ - %@", [NSDate getDateWithString:[[[CurrentUser sharedInstance] timeMorningStart] stringValue]], [NSDate getDateWithString:[[[CurrentUser sharedInstance] timeMorningEnd] stringValue]]]];
//            [fdv addSubview:rtv];
        } else {
            
            [[_builderView getBottomView] addSubview:ride];
        }
    
    } else {
        ride = [[[NSBundle mainBundle] loadNibNamed:@"WorkToHome" owner:self options:nil] objectAtIndex:0];
        [ride setTranslatesAutoresizingMaskIntoConstraints:NO];
        if (_cellType == PassengerCellTypeTooLate) {
////            [self settingsRideToViewWithType:rideType];
////            [rtv setTranslatesAutoresizingMaskIntoConstraints:NO];
////            [tooLate addSubview:rtv];
        } else if (_cellType == PassengerCellTypeFindDriver) {
////            [self settingsRideToViewWithType:rideType];
////            [rtv setTranslatesAutoresizingMaskIntoConstraints:NO];
////            [fdv.findDriverButton setTitle:@"REQUEST A RIDE TO HOME" forState:UIControlStateNormal];
////            [fdv.timeInterval setText:[NSString stringWithFormat:@"%@ - %@", [NSDate getDateWithString:[[[CurrentUser sharedInstance] timeEveningStart] stringValue]], [NSDate getDateWithString:[[[CurrentUser sharedInstance] timeEveningEnd] stringValue]]]];
////            [fdv addSubview:rtv];
        } else {
            [[_builderView getBottomView] addSubview:ride];
        }
    }
    [(UIView *)ride subviews][0].alpha = 0.5;
    [self constraintsForRide:ride];
}

- (void)constraintsForRide:(id)ride {
    NSDictionary *views = @{@"ride": ride};
    if (_cellType == PassengerCellTypeTooLate) {
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
    } else if (_cellType == PassengerCellTypeFindDriver) {
//        [fdv addConstraint:[NSLayoutConstraint constraintWithItem:rtv
//                                                        attribute:NSLayoutAttributeCenterX
//                                                        relatedBy:NSLayoutRelationEqual
//                                                           toItem:fdv
//                                                        attribute:NSLayoutAttributeCenterX
//                                                       multiplier:1
//                                                         constant:-58]];
//        [fdv addConstraint:[NSLayoutConstraint constraintWithItem:rtv
//                                                        attribute:NSLayoutAttributeCenterY
//                                                        relatedBy:NSLayoutRelationEqual
//                                                           toItem:fdv
//                                                        attribute:NSLayoutAttributeCenterY
//                                                       multiplier:1
//                                                         constant:-60]];
    } else {
        [[_builderView getBottomView] addConstraint:[NSLayoutConstraint constraintWithItem:ride
                                                                        attribute:NSLayoutAttributeCenterX
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:[_builderView getBottomView]
                                                                        attribute:NSLayoutAttributeCenterX multiplier:1
                                                                         constant:WidthWithPercent(28)]];
        
        [[_builderView getBottomView] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[ride]|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:views]];
    }
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)removeAllSubviews {
    [approvedView removeFromSuperview];
    [nowView removeFromSuperview];
    [pendingView removeFromSuperview];
    [requestView removeFromSuperview];
    [finalView removeFromSuperview];
    [tooLateView removeFromSuperview];
}

#pragma mark - Setter methods

- (void)setName:(NSString *)name {
    _builderView.name = name;
}

- (void)setAvatarURL:(NSURL *)avatarURL {
    
}

- (void)setIsFavorite:(BOOL)isFavorite {
     _builderView.isFavorite = isFavorite;
}

- (void)setRating:(float)rating {
     _builderView.rating = rating;
}

- (void)setDate:(NSString *)date {
     _builderView.date = date;
}

- (void)setPrice:(NSString *)price {
     _builderView.price = price;
}

- (void)setBuilderBottomView:(BuilderView *)builderView {
    _builderView = builderView;
}

@end