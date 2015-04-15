//
//  TodayOverView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/13.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "TodayOverView.h"
#import "KRProgressView.h"

@interface TodayOverView ()

@property (nonatomic, strong) UILabel *burnedValueLabel;
@property (nonatomic, strong) UILabel *targetValueLabel;

@end

@implementation TodayOverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self setTitleText:@"TODAY/Overview"];
        UIView *burnedLine = [self createLineWithOriginY:self.titleLabel.maxY];
        
        UILabel *burnedLabel = [self createTitleLabelWithOriginY:burnedLine.maxY scale:0.05  text:@"YOUR BURNED"];
    
        UILabel *totalLabel = [self createTitleLabelWithOriginY:burnedLabel.maxY scale:0.03 text:@"Total"];
        totalLabel.font = [UIFont fontHelveticaNeueLightSize:20];
        totalLabel.textAlignment = NSTextAlignmentLeft;
        
        self.burnedValueLabel = [self createTitleLabelWithOriginY:totalLabel.maxY scale:0.1 text:@""];
        
        self.burnedProgress = [[KRProgressView alloc] initWithFrame:CGRectMake(20, self.burnedValueLabel.maxY + 10, self.backgroundView.width - 40, self.backgroundView.height * 0.03) progressType:KRProgressBarType];
        self.burnedProgress.progressBackgroundColor = [UIColor progressBackgroundColor];
        self.burnedProgress.progressColor = [UIColor pageYellowColor];
        [self.backgroundView addSubview:self.burnedProgress];
        [self setBurnedMaxValue:4500 usageValue:3513];
        
        self.xbikeLabel = [self createEquipmentLabelWithFrame:CGRectMake((self.backgroundView.width  * 0.5) - (self.backgroundView.width * 0.11), self.burnedProgress.maxY + 15, self.backgroundView.width * 0.22, self.backgroundView.width * 0.22) text:@"Xbike"];
        
        self.basicLabel = [self createEquipmentLabelWithFrame:CGRectMake(self.xbikeLabel.minX - self.backgroundView.width * 0.22 - 20, self.xbikeLabel.minY, self.backgroundView.width * 0.22, self.backgroundView.width * 0.22) text:@"Basic"];
        
        self.stopperLabel = [self createEquipmentLabelWithFrame:CGRectMake(self.xbikeLabel.maxX + 20, self.xbikeLabel.minY, self.backgroundView.width * 0.22, self.backgroundView.width * 0.22) text:@"Stepper"];
    
    
        UIView *targetLine = [self createLineWithOriginY:self.xbikeLabel.maxY + 15];
        targetLine.alpha = 0.5;
        
        UILabel *targetLabel = [self createTitleLabelWithOriginY:targetLine.maxY scale:0.05  text:@"MY TARGET"];
        
        UILabel *calLabel = [self createTitleLabelWithOriginY:targetLabel.maxY scale:0.03 text:@"CAL"];
        calLabel.font = [UIFont fontHelveticaNeueLightSize:20];
        calLabel.textAlignment = NSTextAlignmentLeft;
        [calLabel sizeToFit];
        
        UIImageView *calIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cal_icon"]];
        calIcon.frame = CGRectMake(calLabel.minX, calLabel.minY, calLabel.height, calLabel.height);
        calLabel.frame = CGRectMake(calIcon.maxX + 5, calLabel.minY, calLabel.width, calLabel.height);
        [self.backgroundView addSubview:calIcon];
        
        self.targetValueLabel = [self createTitleLabelWithOriginY:targetLabel.maxY scale:0.03 text:@""];
        self.targetValueLabel.textAlignment = NSTextAlignmentRight;
        self.targetValueLabel.font = [UIFont fontHelveticaNeueLightSize:20];
        
        self.targetProgress = [[KRProgressView alloc] initWithFrame:CGRectMake(20, calLabel.maxY + 10, self.backgroundView.width - 40, self.backgroundView.height * 0.03) progressType:KRProgressDotType];
        [self.targetProgress setIconProgressFullImage:[UIImage imageNamed:@"icon_progress_green"] emptyImage:[UIImage imageNamed:@"icon_progress_empty"]];
        [self.backgroundView addSubview:self.targetProgress];
        [self setCalMaxValue:3000 usageValue:1000];
        
        UIView *socialLine = [self createLineWithOriginY:self.targetProgress.maxY + 15];
        
        UILabel *socialLabel = [self createTitleLabelWithOriginY:socialLine.maxY scale:0.05  text:@"SOCIAL GAME"];
        
        UIView *actionButtonLine = [self createLineWithOriginY:self.actionButton.minY];
        actionButtonLine.alpha = 0.5;
        
        self.socialGameView = [[UITableView alloc] initWithFrame:CGRectMake(socialLabel.minX, socialLabel.maxY, socialLabel.width, actionButtonLine.minY - socialLabel.maxY) style:UITableViewStylePlain];
        self.socialGameView.backgroundColor = [UIColor clearColor];
        self.socialGameView.rowHeight = 40;
        self.socialGameView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.socialGameView.showsHorizontalScrollIndicator = NO;
        self.socialGameView.showsVerticalScrollIndicator = NO;
        [self.backgroundView addSubview:self.socialGameView];
    }
    return self;
}

- (UIView *)createLineWithOriginY:(CGFloat)y {
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(20, y, self.backgroundView.width - 40, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [self.backgroundView addSubview:line];
    return line;
}

- (UILabel *)createTitleLabelWithOriginY:(CGFloat)y scale:(CGFloat)scale text:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, y, self.backgroundView.width - 40, self.backgroundView.height * scale)];
    label.font = [UIFont fontHelveticaNeueBoldSize:24];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = text;
    [self.backgroundView addSubview:label];
    return label;
}

- (UILabel *)createEquipmentLabelWithFrame:(CGRect)frame text:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.layer.cornerRadius = label.width / 2;
    label.layer.borderColor = [UIColor whiteColor].CGColor;
    label.layer.borderWidth = 3;
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontHelveticaNeueBoldSize:18];
    label.textColor = [UIColor whiteColor];
    label.text = text;
    [self.backgroundView addSubview:label];
    return label;
}

- (void)setBurnedMaxValue:(CGFloat)max usageValue:(CGFloat)usageValue {
    NSMutableAttributedString *attrubutes = [[NSMutableAttributedString alloc] init];
    NSAttributedString *prefixString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%0.f", usageValue] attributes:[UIFont boldAttrubutesSize:60]];
    
    NSAttributedString *subfixString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" / %0.f", max] attributes:[UIFont lightAttrubutesSize:30]];
    [attrubutes appendAttributedString:prefixString];
    [attrubutes appendAttributedString:subfixString];
    self.burnedProgress.maxValue = max;
    self.burnedProgress.progess = usageValue;
    self.burnedValueLabel.attributedText = attrubutes;
}

- (void)setCalMaxValue:(CGFloat)max usageValue:(CGFloat)usageValue {
    self.targetProgress.maxValue = max;
    self.targetProgress.progess = usageValue;
    self.targetValueLabel.text = [NSString stringWithFormat:@"%0.f/%0.f", usageValue, max];
}

@end
