//
//  PaxPendingView.m
//  CPACustomBookings
//
//  Created by Vlad on 28.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import "PaxPendingView.h"

@interface PaxPendingView ()

@property (weak, nonatomic) IBOutlet BuilderView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation PaxPendingView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (BuilderView *)getBottomView {
    return _bottomView;
}

- (void)setDate:(NSString *)date {
    _dateLabel.text = date;
}

- (IBAction)cancelAction:(id)sender {
    NSLog(@"CLICK CANCEL IN PENDING!");
}
@end
