//
//  PaxCanceledOrFinishedView.m
//  CPACustomBookings
//
//  Created by Vlad on 28.04.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

#import "PaxCanceledOrFinishedView.h"

@interface PaxCanceledOrFinishedView ()

@property (weak, nonatomic) IBOutlet BuilderView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UIImageView *likeImage;
@property (weak, nonatomic) IBOutlet UIImageView *priceImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation PaxCanceledOrFinishedView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (BuilderView *)getBottomView {
    return _bottomView;
}

- (void)setName:(NSString *)name {
    _nameLabel.text = name;
}

- (void)setAvatarURL:(NSURL *)avatarURL {
    
}

- (void)setIsFavorite:(BOOL)isFavorite {
    _likeImage.hidden = isFavorite;
}

- (void)setDate:(NSString *)date {
    _dateLabel.text = date;
}

- (void)setPrice:(NSString *)price {
    [self writeTextWithString:price];
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

@end
