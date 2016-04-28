//
//  PaxNowView.m
//  CPACustomBookings
//
//  Created by Vlad on 28.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import "PaxNowView.h"

@interface PaxNowView ()

@property (weak, nonatomic) IBOutlet BuilderButtomView *bottomView;

@end

@implementation PaxNowView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (BuilderButtomView *)getBottomView {
    return _bottomView;
}

@end
