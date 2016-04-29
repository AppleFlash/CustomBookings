//
//  BuilderButtomView.h
//  CPACustomBookings
//
//  Created by Vlad on 28.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuilderView : UIView

@property (strong, nonatomic) NSURL *avatarURL;
//@property (weak, nonatomic) UIImageView *priceImage;
@property (assign, nonatomic) BOOL isFavorite;
@property (assign, nonatomic) float rating;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *status;

- (BuilderView *)getBottomView;
@end
