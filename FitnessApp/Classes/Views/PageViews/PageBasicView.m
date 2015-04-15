//
//  PageBasicView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "PageBasicView.h"

@implementation PageBasicView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor pageBasicBackgroundColor];
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(10, 30, self.width - 20, self.height - 40)];
        self.backgroundView.backgroundColor = [UIColor pageBlueColor];
        self.backgroundView.layer.cornerRadius = 10;
        [self addSubview:self.backgroundView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, self.backgroundView.width - 40, self.height * 0.1)];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.backgroundView addSubview:self.titleLabel];
        
        self.actionButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.actionButton.frame = CGRectMake(10, self.backgroundView.height - self.backgroundView.height * 0.08, self.backgroundView.width - 20, self.backgroundView.height * 0.08);
        self.actionButton.titleLabel.font = [UIFont fontHelveticaNeueBoldSize:40];
        [self.actionButton setTitle:@"OK" forState:UIControlStateNormal];
        [self.actionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.backgroundView addSubview:self.actionButton];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.cancelButton.frame = CGRectMake(self.backgroundView.width - self.backgroundView.width * 0.15, self.titleLabel.midY - (self.backgroundView.width * 0.11 / 2), self.backgroundView.width * 0.11, self.backgroundView.width * 0.11);
        [self.cancelButton setImage:[UIImage imageNamed:@"bt_cancel_game"] forState:UIControlStateNormal];
        [self.cancelButton setTintColor:[UIColor whiteColor]];
        [self.backgroundView addSubview:self.cancelButton];
        
        self.alpha = 0.0;
        [self showPage];
    }
    return self;
}

- (void)setTitleText:(NSString *)text {
    NSArray *strings = [text componentsSeparatedByString:@"/"];
    NSMutableAttributedString *attrubutes = [[NSMutableAttributedString alloc] init];
    NSAttributedString *prefixString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", strings[0]] attributes:[UIFont boldAttrubutesSize:36]];
    [attrubutes appendAttributedString:prefixString];
    if(strings.count > 1) {
        NSAttributedString *subfixString = [[NSAttributedString alloc] initWithString:strings[1] attributes:[UIFont lightAttrubutesSize:20]];
        [attrubutes appendAttributedString:subfixString];
    }
    self.titleLabel.attributedText = attrubutes;
}

- (void)setBackgroundViewColor:(UIColor *)color {
    self.backgroundView.backgroundColor = color;
}

- (void)showPage {
    typeof(self) __weak weakSelf = self;
    self.alpha = 0.0;
    self.backgroundView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
        weakSelf.alpha = 1.0;
        weakSelf.backgroundView.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
