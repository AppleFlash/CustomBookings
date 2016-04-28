//
//  PassengerBookingTableViewCell.m
//  carpoolarabia_ios
//
//  Created by Admin on 16/11/15.
//  Copyright © 2015 gritsay. All rights reserved.
//
#define SBColorApproved RGBColor(0x1bd19f, 1)
#define SBColorPending RGBColor(0xff8400, 1)
#define SBColorFinished RGBColor(0x475269, 1)
#define SBColorEnRoute RGBColor(0xc46fff, 1)
#define lightGray RGBColor(0xe0e7ef, 1)
#define darkGray RGBColor(0xa2b4cb, 1)

#define HeightWithPercent(heightPercent) (heightPercent*[[UIScreen mainScreen] bounds].size.height)/100
#define WidthWithPercent(widthPercent) (widthPercent*[[UIScreen mainScreen] bounds].size.width)/100

#import "PassengerBookingXibTableViewCell.h"
#import "PaxViews/PaxApprovedView.h"
#import "PaxViews/PaxNowView.h"
#import "PaxViews/PaxPendingView.h"
#import "PaxViews/PaxRequestToView.h"
#import "PaxViews/PaxTooLateView.h"
#import "PaxViews/PaxCanceledOrFinishedView.h"

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
}

- (void)setCellType:(PassengerCellType)cellType {
    [self removeAllSubviews];
    _cellType = cellType;
    switch (cellType) {
        case PassengerCellTypeFindDriver:
            
            requestView = [[NSBundle mainBundle] loadNibNamed:@"PaxRequestTo" owner:self options:nil][0];
            [requestView setTranslatesAutoresizingMaskIntoConstraints:NO];
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
//    [self removeImageDirection];
    id ride;
    if (rideType == RideToTypeHome) {
        ride = [[[NSBundle mainBundle] loadNibNamed:@"HomeToWork" owner:self options:nil] objectAtIndex:0];
        [ride setTranslatesAutoresizingMaskIntoConstraints:NO];
//        if (_cellType == PassengerCellTypeTooLate) {
//            [self settingsRideToViewWithType:rideType];
//            [rtv setTranslatesAutoresizingMaskIntoConstraints:NO];
//            [tooLate addSubview:rtv];
            
//        } else if (_cellType == PassengerCellTypeFindDriver) {
//            [self settingsRideToViewWithType:rideType];
//            [rtv setTranslatesAutoresizingMaskIntoConstraints:NO];
//            [fdv.findDriverButton setTitle:@"REQUEST A RIDE TO WORK" forState:UIControlStateNormal];
//            [fdv.timeInterval setText:[NSString stringWithFormat:@"%@ - %@", [NSDate getDateWithString:[[[CurrentUser sharedInstance] timeMorningStart] stringValue]], [NSDate getDateWithString:[[[CurrentUser sharedInstance] timeMorningEnd] stringValue]]]];
//            [fdv addSubview:rtv];
//        } else {
            [[_builderBottomView getBottomView] addSubview:ride];
//        }
        
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
            [[_builderBottomView getBottomView] addSubview:ride];
        }
    }
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
        [[_builderBottomView getBottomView] addConstraint:[NSLayoutConstraint constraintWithItem:ride
                                                                        attribute:NSLayoutAttributeCenterX
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:[_builderBottomView getBottomView]
                                                                        attribute:NSLayoutAttributeCenterX multiplier:1
                                                                         constant:WidthWithPercent(28)]];
        
        [[_builderBottomView getBottomView] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[ride]|"
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

- (void)setBuilderBottomView:(BuilderButtomView *)builderBottomView {
    _builderBottomView = builderBottomView;
}

@end