//
//  HistoryView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EquipmentSelectView;
@class UICalendar;

@interface HistoryView : UIView

@property (nonatomic, strong) EquipmentSelectView *equipmentSelector;
@property (nonatomic, strong) UICalendar *calendar;
@end
