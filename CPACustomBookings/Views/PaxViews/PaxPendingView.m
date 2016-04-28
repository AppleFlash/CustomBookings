//
//  PaxPendingView.m
//  CPACustomBookings
//
//  Created by Vlad on 28.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import "PaxPendingView.h"

@interface PaxPendingView ()

@property (weak, nonatomic) IBOutlet BuilderButtomView *bottomView;

@end

@implementation PaxPendingView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (BuilderButtomView *)getBottomView {
    return _bottomView;
}

@end
