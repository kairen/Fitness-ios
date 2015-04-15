//
//  StatusViewCell.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/16.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KRProgressView;

@interface StatusViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                    tableView:(UITableView *)tableView;

- (void)setProgressValue:(CGFloat)value;

@property (nonatomic, strong) KRProgressView *progressView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *valueLabel;

@end
