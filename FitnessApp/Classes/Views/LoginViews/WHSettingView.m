//
//  WHSettingView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "WHSettingView.h"
#import "KRProgressView.h"

@interface WHSettingView ()
@property (nonatomic, strong) UILabel *bodyMassIndexLabel;
@property (nonatomic, strong) UILabel *caloriesLabel;
@end

@implementation WHSettingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.showLogo = NO;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.logoImage.frame];
        [self configureLabel:titleLabel text:@"WELCOME!"];
        titleLabel.font = [UIFont boldSystemFontOfSize:46];
        
        UILabel *whLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x - (titleLabel.width * 0.5), titleLabel.maxY + (self.height * 0.026), titleLabel.width, self.height * 0.044)];
        [self configureLabel:whLabel text:@"Enter height and weight"];
        whLabel.font = [UIFont boldSystemFontOfSize:24];
        
        self.heightField = [[UITextField alloc] initWithFrame:CGRectMake(self.logoImage.minX, whLabel.maxY + 10, self.logoImage.width, self.height * 0.075)];
        [self configureTextField:self.heightField placeHolder:@"Enter your height" leftImage:@"height"];
        [self addUnitLabelAtField:self.heightField unitText:@"cm"];
        self.heightField.keyboardType = UIKeyboardTypeNumberPad;
        
        self.weightField = [[UITextField alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.heightField.maxY + 10, self.logoImage.width, self.height * 0.075)];
        [self configureTextField:self.weightField placeHolder:@"Enter your weight" leftImage:@"weight"];
        [self addUnitLabelAtField:self.weightField unitText:@"kg"];
        self.weightField.keyboardType = UIKeyboardTypeNumberPad;
        
        self.bodyMassIndexLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.weightField.maxY + 10, self.logoImage.width, self.height * 0.075)];
        self.bodyMassIndexLabel.textAlignment = NSTextAlignmentCenter;
        [self setBodyMessIndexValue:28];
        [self addSubview:self.bodyMassIndexLabel];
        
        UILabel *explainLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.bodyMassIndexLabel.maxY, self.logoImage.width, self.height * 0.075)];
        [self configureLabel:explainLabel text:@"Has a little overweight,\n need to lose weight for your health."];
        
        self.caloriesLabel = [[UILabel alloc] initWithFrame:CGRectMake(explainLabel.minX, explainLabel.maxY, explainLabel.width, self.height * 0.075)];
        self.caloriesLabel.textColor = [UIColor whiteColor];
        [self setCaloriesValue:4500];
        self.caloriesLabel.adjustsFontSizeToFitWidth = YES;
        self.caloriesLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.caloriesLabel];
        
        self.progressView = [[KRProgressView alloc] initWithFrame:CGRectMake(self.caloriesLabel.minX, self.caloriesLabel.maxY + 10, self.caloriesLabel.width, self.height * 0.044) progressType:KRProgressBarType];
        self.progressView.progressBackgroundColor = [UIColor progressBackgroundColor];
        self.progressView.progressColor = [UIColor pageYellowColor];
        self.progressView.maxValue = 6000;
        self.progressView.progess = 4500;
        [self addSubview:self.progressView];
        
        UILabel *subExplainLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x - (self.width * 0.365), self.progressView.maxY + 10, self.width * 0.73, self.height * 0.075)];
        [self configureLabel:subExplainLabel text:@"This will determine how many Calories \n you should burn each day."];
        
        self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.nextButton.frame = CGRectMake(self.center.x - (self.width * 0.16), subExplainLabel.maxY + 10, self.width * 0.32, self.height * 0.075);
        [self configureButton:self.nextButton title:@"Next" fillCollor:YES];
    }
    return self;
}

- (void)setCaloriesValue:(NSInteger)value {
     NSMutableAttributedString *megreString = [[NSMutableAttributedString alloc] initWithString:@"Daily Goal " attributes:[UIFont lightAttrubutesSize:20]];
    
    NSAttributedString *valueString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", (long)value] attributes:[UIFont boldAttrubutesSize:40]];
    [megreString appendAttributedString:valueString];
    [megreString appendAttributedString:[[NSAttributedString alloc] initWithString:@" Calories"attributes:[UIFont lightAttrubutesSize:20]]];
    self.caloriesLabel.attributedText = megreString;
}

- (void)setBodyMessIndexValue:(NSInteger)value {
    NSMutableAttributedString *megreString = [[NSMutableAttributedString alloc] initWithString:@"Your BMI is " attributes:[UIFont bmiLightAttrubutes]];
    
    NSAttributedString *valueString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", (long)value] attributes:[UIFont boldAttrubutesSize:40]];
    [megreString appendAttributedString:valueString];
    self.bodyMassIndexLabel.attributedText = megreString;
}

- (void)configureLabel:(UILabel*)label text:(NSString*)text{
    label.textColor = [UIColor whiteColor];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontHelveticaNeueLightSize:18];
    label.adjustsFontSizeToFitWidth = YES;
    label.lineBreakMode = NSLineBreakByClipping;
    label.numberOfLines = 0;
    [self addSubview:label];
}

- (void) addUnitLabelAtField:(UITextField*)field unitText:(NSString*)unit {
    UILabel *unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(field.maxX, field.midY - (self.height * 0.0375), self.width - field.maxX, self.height * 0.075)];
    unitLabel.text = unit;
    unitLabel.textColor = [UIColor whiteColor];
    unitLabel.textAlignment = NSTextAlignmentCenter;
    unitLabel.font = [UIFont fontHelveticaNeueLightSize:28];
    [self addSubview:unitLabel];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.weightField resignFirstResponder];
    [self.heightField resignFirstResponder];
}
@end