//
//  ApprovedView.m
//  CPACustomBookings
//
//  Created by Vlad on 28.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import "PaxApprovedView.h"

@interface PaxApprovedView ()

@property (weak, nonatomic) IBOutlet BuilderButtomView *bottomView;

@end

@implementation PaxApprovedView

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"PAX APPROVED");
}

- (BuilderButtomView *)getBottomView {
    return _bottomView;
}

@end
