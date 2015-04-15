//
//  StatusViewCell.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/16.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "StatusViewCell.h"
#import "KRProgressView.h"

@implementation StatusViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                    tableView:(UITableView *)tableView {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, tableView.rowHeight - 1, tableView.width, 1)];
        line.backgroundColor = [UIColor whiteColor];
        line.alpha = 0.5;
        [self addSubview:line];
        
        CGFloat rowHeight = tableView.rowHeight;
        CGFloat width = tableView.width;
        
//        self.progressView = [[KRProgressView alloc] initWithFrame:CGRectMake(0, rowHeight - (rowHeight * 0.5), width, rowHeight * 0.4) progressType:KRProgressBarType];
//        self.progressView.progressBackgroundColor = [UIColor progressBackgroundColor];
//        self.progressView.progressColor = [UIColor pagePurpleColor];
//        self.progressView.maxValue = 100;
//        self.progressView.progess = 50;
//        [self addSubview:self.progressView];
//        
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.progressView.minX, 0, self.progressView.width * 0.5, rowHeight  * 0.4)];
//        self.titleLabel.text = @"Sam";
//        self.titleLabel.textAlignment = NSTextAlignmentLeft;
//        self.titleLabel.textColor = [UIColor whiteColor];
//        self.titleLabel.font = [UIFont fontHelveticaNeueBoldSize:16];
//        [self addSubview:self.titleLabel];
//        
//        self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.maxX, 0, self.progressView.width * 0.5 , rowHeight  * 0.4)];
//        self.valueLabel.text = @"75%";
//        self.valueLabel.textAlignment = NSTextAlignmentRight;
//        self.valueLabel.textColor = [UIColor whiteColor];
//        self.valueLabel.font = [UIFont fontHelveticaNeueLightSize:16];
//        [self addSubview:self.valueLabel];
    }
    return self;
}

- (void)setProgressValue:(CGFloat)value {
    self.valueLabel.text = [NSString stringWithFormat:@"%0.f%@", value, @"%"];
    self.progressView.progess = value;
    [self.progressView refreshProgress];
}

@end
