//
//  BaseView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseLoginView.h"

@implementation BaseLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.layer.rasterizationScale = [UIScreen mainScreen].scale * 2;
        self.layer.contentsScale = [UIScreen mainScreen].scale * 2;
        CAGradientLayer *backgroundLayer = [CAGradientLayer layer];
        backgroundLayer.frame = self.bounds;
        backgroundLayer.colors = [UIColor gradientBlueColors];
        [self.layer addSublayer:backgroundLayer];
        
        self.logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.center.x - (self.width * 0.35), self.height *  0.12, self.width * 0.7, self.height * 0.1)];
        self.logoImage .image = [UIImage fitImage:@"logo_white" size:self.logoImage.size];
        [self addSubview:self.logoImage ];
        self.showLogo = NO;
    }
    return self;
}

- (void)setShowLogo:(BOOL)showLogo {
    _showLogo = showLogo;
    self.logoImage.hidden = !showLogo;
}

- (void)configureTextField:(UITextField *)textField  placeHolder:(NSString *)hoderString leftImage:(NSString *)imageName {
    textField.textColor = [UIColor pageBlueColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:hoderString attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.height * 0.075, self.height * 0.05)];
    leftImage.image = [UIImage fitImage:imageName size:leftImage.size];
    textField.leftView = leftImage;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.keyboardType = UIKeyboardTypeURL;
    textField.adjustsFontSizeToFitWidth = YES;
    textField.delegate = self;
    [self addSubview:textField];
}

- (void)configureButton:(UIButton *)button title:(NSString *) title fillCollor:(BOOL)fill {
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    if(fill) {
        CAGradientLayer *buttonLayer = [CAGradientLayer layer];
        buttonLayer.colors = [UIColor gradientOrangeColors];
        buttonLayer.frame = button.bounds;
        [button.layer addSublayer:buttonLayer];
    }
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:title  forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self addSubview:button];
}

#pragma mark - UITextFieldDelegate Method
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGFloat keyboardHeight = [self getKeyboardDevice];
    if(textField.maxY >= (self.height - keyboardHeight)) {
        CGFloat offsetHeight = textField.maxY - (self.height - keyboardHeight)  ;
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformMakeTranslation(0, - offsetHeight);
        }];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end