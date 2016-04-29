//
//  DriverBuilderView.h
//  CPACustomBookings
//
//  Created by Vlad on 29.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DriverBuilderView : UIView

@property (strong, nonatomic) NSURL *avatarURL;
//@property (weak, nonatomic) UIImageView *priceImage;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *detour;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *status;

- (DriverBuilderView *)getBottomView;

@end
