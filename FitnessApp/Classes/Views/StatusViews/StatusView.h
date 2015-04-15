//
//  StatusView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EquipmentSelectView;

@interface StatusView : UIView

@property (nonatomic, strong) EquipmentSelectView *equipmentSelector;
@property (nonatomic, strong) UITableView *chartTableView;

@end
