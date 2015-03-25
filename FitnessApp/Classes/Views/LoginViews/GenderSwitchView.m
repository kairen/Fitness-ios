//
//  GenderSwitchView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "GenderSwitchView.h"

@interface GenderSwitchView ()

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation GenderSwitchView

- (instancetype)initWithFrame:(CGRect)frame
                    leftImage:(NSString *)leftImage
              leftUnselectImage:(NSString *)leftUnselect
                   rightImage:(NSString *)rightImage
             rightUnselectImage:(NSString *)rightUnselect {
    self = [super initWithFrame:frame];
    if(self) {
        self.leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.leftButton.frame = CGRectMake(0, (self.height * 0.5) - (self.width * 0.075), self.width * 0.5, self.width * 0.15);
        [self configureButton:self.leftButton selectImage:leftImage unselectImage:leftUnselect];
        self.leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, - self.width * 0.225, 0, 0);
        self.leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, self.width * 0.1, 0, self.width * 0.25);
        self.leftButton.tag = 0;
        self.leftButton.alpha = 1.0;
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.rightButton.frame = CGRectMake(self.width * 0.5, self.leftButton.minY, self.width * 0.5, self.width * 0.15);
        [self configureButton:self.rightButton selectImage:rightImage unselectImage:rightUnselect];
        self.rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, - self.width * 0.325, 0, self.width * 0.05);
        self.rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, self.width * 0.35);
        self.rightButton.tag = 1;
        self.rightButton.alpha = 0.5;
    }
    return self;
}

- (void)configureButton:(UIButton *)button selectImage:(NSString *)selectImage unselectImage:(NSString *)unselectImage {
    button.tintColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    [button setImage:[UIImage fitImage:unselectImage size:button.size] forState:UIControlStateNormal];
    [button setImage:[UIImage fitImage:selectImage size:button.size] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)setLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle {
    [self.leftButton setTitle:leftTitle forState:UIControlStateNormal];
    [self.rightButton setTitle:rightTitle forState:UIControlStateNormal];
}

- (void)buttonAction:(UIButton *)button {
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.leftButton.alpha = weakSelf.rightButton.alpha = 0.5;
        button.alpha = 1.0;
    }];
    
    if([self.delegate respondsToSelector:@selector(genderSwitchView:didSelectAtItem:)]) {
        [self.delegate genderSwitchView:self didSelectAtItem:button.tag];
    }
}
@end
