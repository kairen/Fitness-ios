//
//  StatusView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "StatusView.h"
#import "EquipmentSelectView.h"

static CGFloat const SVOirginX = 70;
static CGFloat const SVEdgeHeight = 60;

@implementation StatusView

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
        
        self.equipmentSelector = [[EquipmentSelectView alloc] initWithFrame:CGRectMake(0, SVOirginX, self.width, SVOirginX) titles:titles fullImages:unselectImages selectImages:selectImages];
        [self addSubview:self.equipmentSelector];
        
        self.chartTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.equipmentSelector.maxY, self.width, self.height - SVOirginX - SVEdgeHeight) style:UITableViewStylePlain];
        self.chartTableView.backgroundColor = [UIColor clearColor];
        self.chartTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.chartTableView.rowHeight = 50;
        [self addSubview:self.chartTableView];
        
    }
    return self;
} 

@end
