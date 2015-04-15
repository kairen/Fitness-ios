//
//  HistoryView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HistoryView.h"
#import "EquipmentSelectView.h"
#import "UICalendar.h"

@implementation HistoryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        CAGradientLayer *backgroundLayer = [CAGradientLayer layer];
        backgroundLayer.frame = self.bounds;
        backgroundLayer.colors = [UIColor gradientBlueColors];
        [self.layer addSublayer:backgroundLayer];
        
        NSArray *titles = @[@"All", @"XBike", @"Core Fit"];
        NSArray *unselectImages = @[@"basic_unselected", @"xbike_unselected", @"corefit_unselected"];
        NSArray *selectImages = @[@"basic_selected", @"xbike_selected", @"corefit_selected"];
        
        self.equipmentSelector = [[EquipmentSelectView alloc] initWithFrame:CGRectMake(0, 70, self.width, 70) titles:titles fullImages:unselectImages selectImages:selectImages];
        [self addSubview:self.equipmentSelector];
        
        self.calendar = [[UICalendar alloc] initWithFrame:CGRectMake(0, self.equipmentSelector.maxY, self.width, self.height - self.equipmentSelector.height - 60 - 60)];
        [self addSubview:self.calendar];
    }
    return self;
}

@end
