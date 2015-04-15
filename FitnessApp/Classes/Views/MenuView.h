//
//  MenuView.h
//  Social
//
//  Created by nutc on 2015/3/26.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewDelegate;

@interface MenuView : UIView

@property (nonatomic, weak) id<MenuViewDelegate> delegate;

- (void)showInView:(UIView *)view;
- (void)dismiss;

@property (nonatomic, getter=isShow) BOOL show;

@end

@protocol MenuViewDelegate <NSObject>

@optional
- (void)menuView:(MenuView *)menuView didSeletedButtonIndex:(NSInteger)buttonIndex;

@end
