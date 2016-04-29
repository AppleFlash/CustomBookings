//
//  DriverPendingView.m
//  CPACustomBookings
//
//  Created by Vlad on 29.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import "DriverPendingView.h"

@interface DriverPendingView ()

@property (weak, nonatomic) IBOutlet DriverBuilderView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UIImageView *priceImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *detourLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation DriverPendingView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (DriverBuilderView *)getBottomView {
    return _bottomView;
}

- (void)setAvatarURL:(NSURL *)avatarURL {
    
}

- (void)setDate:(NSString *)date {
    _dateLabel.text = date;
}

- (void)setDetour:(NSString *)detour {
    _detourLabel.text = [NSString stringWithFormat:@"Detour: %@min", detour];
}

- (void)setPrice:(NSString *)price {
    [self writeTextWithString:price];
}

- (void)setName:(NSString *)name {
    _nameLabel.text = name;
}

- (void)writeTextWithString:(NSString *)pastString {
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", pastString]];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, string.length)];
    
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:@"AED"];
    [string2 addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, string2.length)];
    [string appendAttributedString:string2];
    
    [_priceLabel setAttributedText:string];
}

- (IBAction)declineAction:(id)sender {
    NSLog(@"DECLINE IN PENDING");
}

- (IBAction)acceptAction:(id)sender {
    NSLog(@"ACCEPT IN PENDING");
}
@end
