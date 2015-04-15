//
//  DahsboardStatusView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "DahsboardStatusView.h"
#import "KRProgressView.h"


static NSString * const DSNavigationTitles[] = {
    @"TODAY", @"GAME", @"HISTORY"
};

static NSString * const DSNavigationSubTitles[] = {
    @"\nExercise of today", @"\nSet a target, then complete", @"\nCheck your sport history"
};

static NSString * const DSMedalImages[] = {
    @"medal_5th", @"medal_4th", @"medal_3rd", @"medal_2nd", @"medal_1st"
};

@interface DahsboardStatusView ()

@property (nonatomic, strong) UIImageView *personalView;
@property (nonatomic, strong) UIImageView *levelView;
@end

@implementation DahsboardStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor pageGrayColor];
        self.personalView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (self.height * 0.5) - (self.height * 0.375), self.height * 0.75, self.height * 0.75)];
        self.personalView.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.personalView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.personalView.maxX + 5, self.personalView.minY - 5, self.width * 0.3, self.height * 0.4)];
        self.nameLabel.text = @"KaiRen Bai";
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.font = [UIFont fontHelveticaNeueBoldSize:18];
        [self addSubview:self.nameLabel];
        
        self.levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.personalView.maxX + 5, self.nameLabel.maxY , self.width * 0.25, self.height * 0.2)];
        self.levelLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.levelLabel];
        
        self.progressView = [[KRProgressView alloc] initWithFrame:CGRectMake(self.personalView.maxX + 5, self.levelLabel.maxY + 5, self.width * 0.4, self.height * 0.2) progressType:KRProgressBarType];
        self.progressView.progressBackgroundColor = [UIColor colorWithWhite:0.738 alpha:1.000];
        self.progressView.progressColor = [UIColor pageOrangeColor];
        self.progressView.maxValue = 1000;
        self.progressView.progess = 263;
        [self addSubview:self.progressView];
        
        self.levelView = [[UIImageView alloc] initWithFrame:CGRectMake(self.nameLabel.maxX, self.nameLabel.minY, self.progressView.minY - self.nameLabel.minY - 10, self.progressView.minY - self.nameLabel.minY - 10)];
        [self addSubview:self.levelView];
        
        self.navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.width - (self.width * 0.35) - 5, self.personalView.minY - 5, self.width * 0.35, self.height)];
        self.navigationLabel.numberOfLines = 0;
        self.navigationLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.navigationLabel.adjustsFontSizeToFitWidth = YES;
        self.navigationLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.navigationLabel];
        
        [self changeNavigationWithPageType:DashboardTodayPage];
    }
    return self;
}

- (void)setPersonalImage:(UIImage *)personalImage {
    _personalImage = personalImage;
    self.personalView.image = self.personalImage;
}

- (void)changeNavigationWithPageType:(DashboardPageType)type {
    NSMutableAttributedString *strings = [[NSMutableAttributedString alloc] init];
    
    NSMutableDictionary *prefixDict = [NSMutableDictionary dictionaryWithDictionary:[UIFont boldAttrubutesSize:24]];
    prefixDict[NSForegroundColorAttributeName] = [UIColor pageBasicBackgroundColor];
    NSAttributedString *prefixString = prefixString = [[NSAttributedString alloc] initWithString:DSNavigationTitles[type] attributes:prefixDict];
    
    NSMutableDictionary *subfixDict = [NSMutableDictionary dictionaryWithDictionary:[UIFont lightAttrubutesSize:14]];
    subfixDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSAttributedString *subfixString = [[NSAttributedString alloc] initWithString:DSNavigationSubTitles[type] attributes:subfixDict];
    
    [strings appendAttributedString:prefixString];
    [strings appendAttributedString:subfixString];
    self.navigationLabel.attributedText = strings;
    
    self.navigationLabel.alpha = 0.0;
    [UIView animateWithDuration:0.4 animations:^{
        self.navigationLabel.alpha = 1.0;
    }];
}

- (void)setLevelValue:(NSInteger)level {
    NSMutableAttributedString *strings = [[NSMutableAttributedString alloc] init];
    
    NSMutableDictionary *prefixDict = [NSMutableDictionary dictionaryWithDictionary:[UIFont lightAttrubutesSize:16]];
    prefixDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSAttributedString *prefixString = prefixString = [[NSAttributedString alloc] initWithString:@"Level " attributes:prefixDict];
    
    NSMutableDictionary *subfixDict = [NSMutableDictionary dictionaryWithDictionary:[UIFont boldAttrubutesSize:16]];
    subfixDict[NSForegroundColorAttributeName] = [UIColor pageBasicBackgroundColor];
    NSAttributedString *subfixString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", (long)level] attributes:subfixDict];
    
    [strings appendAttributedString:prefixString];
    [strings appendAttributedString:subfixString];
    self.levelLabel.attributedText = strings;
    self.levelView.image = [UIImage fitImage:DSMedalImages[level / 5] size:self.levelView.size];
}

@end
