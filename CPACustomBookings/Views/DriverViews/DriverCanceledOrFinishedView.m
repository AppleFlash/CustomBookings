//
//  DriverCanceledOrFinishedView.m
//  CPACustomBookings
//
//  Created by Vlad on 29.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import "DriverCanceledOrFinishedView.h"

@interface DriverCanceledOrFinishedView ()

@property (weak, nonatomic) IBOutlet DriverBuilderView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UIImageView *priceImage;
@property (weak, nonatomic) IBOutlet UILabel *detourLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation DriverCanceledOrFinishedView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setAvatarURL:(NSURL *)avatarURL {
    
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

- (void)setStatus:(NSString *)status {
    _statusLabel.text = status;
}

- (void)writeTextWithString:(NSString *)pastString {
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", pastString]];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, string.length)];
    
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:@"AED"];
    [string2 addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, string2.length)];
    [string appendAttributedString:string2];
    
    [_priceLabel setAttributedText:string];
}

- (DriverBuilderView *)getBottomView {
    return _bottomView;
}

@end
