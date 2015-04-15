//
//  EquipmentSelectView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "EquipmentSelectView.h"

#define LABEL_GRAY_COLOR [UIColor colorWithWhite:0.8 alpha:1.0]
#define LABEL_GREEN_COLOR [UIColor pageGreenColor]

static CGFloat const ESButtonWidth = 60;

@interface EquipmentSelectView ()

@property (nonatomic, assign) NSInteger selectTag;
@property (nonatomic, strong) NSMutableArray *titleLabels;
@property (nonatomic, strong) NSMutableArray *buttons;
@end

@implementation EquipmentSelectView

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                   fullImages:(NSArray *)fullImages
                 selectImages:(NSArray *)selectImages {
    self = [super initWithFrame:frame];
    if(self) {
        self.selectTag = 0;
        self.backgroundColor = [UIColor whiteColor];
        
        NSAssert(titles.count == selectImages.count, @"Images count not equal for selector");
        
        self.titleLabels = [NSMutableArray array];
        self.buttons = [NSMutableArray array];
        CGFloat edgeWidth = (self.width - (ESButtonWidth * titles.count)) / 4;
        CGFloat originX = edgeWidth;
        
        for(int i = 0; i < fullImages.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(originX, 5, ESButtonWidth, self.height - 5);
            button.tag = i;
            button.selected = (i == 0) ? YES : NO;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setImage:[UIImage fitImage:fullImages[i] size:button.size] forState:UIControlStateNormal];
            [button setImage:[UIImage fitImage:selectImages[i] size:button.size] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            button.clipsToBounds = YES;
            [self addSubview:button];
            
            UILabel *label = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, ESButtonWidth, 15)];
            label.center = CGPointMake(button.width / 2, (button.height / 2) + 18);
            label.textColor = (i == 0) ? LABEL_GREEN_COLOR:LABEL_GRAY_COLOR;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont fontHelveticaNeueLightSize:16];
            label.text = titles[i];
            label.tag = i;
            [button addSubview:label];
            
            originX += (ESButtonWidth + edgeWidth);
            
            [self.titleLabels addObject:label];
            [self.buttons addObject:button];
        }
    }
    return self;
}

- (void)buttonAction:(UIButton *)btn {
    if(self.selectTag != btn.tag) {
        ((UILabel *)self.titleLabels[self.selectTag]).textColor = LABEL_GRAY_COLOR;
        ((UILabel *)self.titleLabels[btn.tag]).textColor = LABEL_GREEN_COLOR;
        ((UIButton *)self.buttons[self.selectTag]).selected = NO;
        btn.selected = YES;
        
        self.selectTag = btn.tag;
        if([self.delegate respondsToSelector:@selector(equipment:didSelectAtIndex:)]) {
            [self.delegate equipment:self didSelectAtIndex:btn.tag];
        }
    }
}

@end
