//
//  EquipmentSelectView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EquipmentDelegate;

@interface EquipmentSelectView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                   fullImages:(NSArray *)fullImages
                 selectImages:(NSArray *)selectImages;

@property (nonatomic, weak) id <EquipmentDelegate> delegate;

@end

@protocol EquipmentDelegate <NSObject>
@required
- (void)equipment:(EquipmentSelectView *)quipment didSelectAtIndex:(NSInteger)index;
@end
