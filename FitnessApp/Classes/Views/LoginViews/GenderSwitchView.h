//
//  GenderSwitchView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GenderType) {
    GenderMale = 0,
    GenderFemale
};

@protocol GenderSwitchDelegate;

@interface GenderSwitchView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                    leftImage:(NSString *)leftImage
            leftUnselectImage:(NSString *)leftUnselect
                   rightImage:(NSString *)rightImage
           rightUnselectImage:(NSString *)rightUnselect;

- (void)setLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;


@property (nonatomic, weak) id <GenderSwitchDelegate> delegate;

@end

@protocol GenderSwitchDelegate <NSObject>
- (void)genderSwitchView:(GenderSwitchView *)switchView didSelectAtItem:(GenderType)genderType;
@end