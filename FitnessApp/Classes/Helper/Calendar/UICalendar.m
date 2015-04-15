//
//  UICalendar.m
//  CalendarDemo
//
//  Created by Wu~ on 2014/9/27.
//  Copyright (c) 2014年 Wu. All rights reserved.
//

#import "UICalendar.h"
#import "UICalendarCell.h"
#import "CalendarMath.h"

#define ItemSpace 10

@interface UICalendar ()

@property (nonatomic, strong, readonly) NSDate *nowDate;
@property (nonatomic, strong, readonly) NSDate *today;
@property (nonatomic, strong) NSArray *monthArray;

@end

@implementation UICalendar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIGraphicsBeginImageContext(frame.size);
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.backgroundColor = [UIColor colorWithPatternImage:image];
        _nowDate = [NSDate date];
        _today = [NSDate date];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.2, ItemSpace, CGRectGetWidth(frame) * 0.6, 35)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:24];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        _monthArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"];
        self.titleLabel.text = [NSString stringWithFormat:@"%@, %ld", _monthArray[(long)[CalendarMath getDateInfoWithDate:_nowDate].month - 1], (long)[CalendarMath getDateInfoWithDate:_nowDate].year];
        [self addSubview:self.titleLabel];
        
        /*  Previous & Next Button  */
        float xAdjust = 0.1;
        int tag = 1;
        for (NSString *image in @[@"Arrow_left.png", @"Arrow_right.png"]) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetWidth(frame) * xAdjust - 17.5, CGRectGetMinY(self.titleLabel.frame), 35, 35);
            [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.tag = tag;
            [button addTarget:self action:@selector(changeDateButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            
            tag ++;
            xAdjust = 0.9;
        }
        
        float xOrigin = ItemSpace;
        for (NSString *date in @[@"SUN", @"MON", @"TUE", @"WED", @"THU", @"FRI", @"SAT"]) {
            self.dateDaysLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOrigin, CGRectGetMaxY(self.titleLabel.frame), (CGRectGetWidth(frame) - ItemSpace * 2) / 7, 25)];
            self.dateDaysLabel.text = date;
            self.dateDaysLabel.font = [UIFont boldSystemFontOfSize:14];
            self.dateDaysLabel.textColor = [UIColor whiteColor];
            self.dateDaysLabel.textAlignment = NSTextAlignmentCenter;
            self.dateDaysLabel.adjustsFontSizeToFitWidth = YES;
            self.dateDaysLabel.backgroundColor = [UIColor clearColor];
            [self addSubview:self.dateDaysLabel];
            
            xOrigin += (CGRectGetWidth(frame) - ItemSpace * 2) / 7;
        }
        
        self.dates = [NSMutableArray array];
        self.dates = [CalendarMath getMonthDateWithDate:_nowDate];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        self.baseCalendarView = [[UICollectionView alloc] initWithFrame:CGRectMake(ItemSpace, CGRectGetMaxY(self.dateDaysLabel.frame), CGRectGetWidth(frame) - ItemSpace * 2, CGRectGetHeight(frame) - CGRectGetMaxY(self.dateDaysLabel.frame) - ItemSpace - 18) collectionViewLayout:layout];
        self.baseCalendarView.delegate = self;
        self.baseCalendarView.dataSource = self;
        self.baseCalendarView.scrollEnabled = NO;
        self.baseCalendarView.backgroundColor = [UIColor clearColor];
        [self.baseCalendarView registerClass:[UICalendarCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        [self addSubview:self.baseCalendarView];
        
        self.baseCalendarView.backgroundColor = [UIColor clearColor];
        
        UIView *legendView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.baseCalendarView.frame), CGRectGetMaxY(self.baseCalendarView.frame), CGRectGetWidth(self.baseCalendarView.frame), CGRectGetHeight(frame) - CGRectGetMaxX(self.baseCalendarView.frame))];
        legendView.backgroundColor = [UIColor clearColor];
        [self addSubview:legendView];
        
        float legendIconSize = CGRectGetHeight(legendView.frame) / 9;

        UIImageView *allImage = [[UIImageView alloc] initWithFrame:CGRectMake(7, CGRectGetHeight(legendView.frame) / 3 + legendIconSize, legendIconSize, legendIconSize)];
        allImage.backgroundColor = [UIColor whiteColor];
        [legendView addSubview:allImage];
        
        UILabel *allLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(allImage.frame) + 5, CGRectGetHeight(legendView.frame) / 4, 30, CGRectGetHeight(legendView.frame) / 3)];
        allLabel.text = @"All";
        allLabel.font = [UIFont fontWithName:@"Avenir" size:10];
        allLabel.textColor = [UIColor whiteColor];
        [allLabel sizeToFit];
        [legendView addSubview:allLabel];
        
        UIImageView *singleImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(allLabel.frame) + 10, CGRectGetHeight(legendView.frame) / 3 + legendIconSize, legendIconSize, legendIconSize)];
        singleImage.backgroundColor = [UIColor yellowColor];
        [legendView addSubview:singleImage];
        
        UILabel *singleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(singleImage.frame) + 5, CGRectGetHeight(legendView.frame) / 4, 30, CGRectGetHeight(legendView.frame) / 3)];
        singleLabel.text = @"Single Target";
        singleLabel.font = [UIFont fontWithName:@"Avenir" size:10];
        singleLabel.textColor = [UIColor yellowColor];
        [singleLabel sizeToFit];
        [legendView addSubview:singleLabel];
        
        UIImageView *socialImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(singleLabel.frame) + 10, CGRectGetHeight(legendView.frame) / 3 + legendIconSize, legendIconSize, legendIconSize)];
        socialImage.backgroundColor = [UIColor orangeColor];
        [legendView addSubview:socialImage];
        
        UILabel *socialLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(socialImage.frame) + 5, CGRectGetHeight(legendView.frame) / 4, 30, CGRectGetHeight(legendView.frame) / 3)];
        socialLabel.text = @"Social Game";
        socialLabel.font = [UIFont fontWithName:@"Avenir" size:10];
        socialLabel.textColor = [UIColor orangeColor];
        [socialLabel sizeToFit];
        [legendView addSubview:socialLabel];


        
        /*  SwipeGestureRecognizer  */
        UISwipeGestureRecognizer *swipeR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(chanegeDateSwipeGestureRecognizer:)];
        [swipeR setDirection:UISwipeGestureRecognizerDirectionRight];
        [self.baseCalendarView addGestureRecognizer:swipeR];
        UISwipeGestureRecognizer *swipeL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(chanegeDateSwipeGestureRecognizer:)];
        [swipeL setDirection:UISwipeGestureRecognizerDirectionLeft];
        [self.baseCalendarView addGestureRecognizer:swipeL];
    }
    return self;
}

#pragma mark - SwipeGestureRecognizer Action
- (void)chanegeDateSwipeGestureRecognizer:(UISwipeGestureRecognizer*)swipe {
    [self chageDateWithIndex:swipe.direction];
}

#pragma mark - Button Clicked Action
- (void)changeDateButtonClickedAction:(UIButton*)sender {
    [self chageDateWithIndex:sender.tag];
}

#pragma mark - Change Date
/*  index = 1 --> Previous Month
    index = 2 --> Next Month      */
- (void)chageDateWithIndex:(NSInteger)index {
    NSArray *changeDates = [[CalendarMath getDateStringWithNSDate:_nowDate] componentsSeparatedByString:@"-"];
    NSInteger changeYear, changeMonth;
    if (index == 1) {
        changeYear = ([changeDates[1] isEqualToString:@"01"]) ? [changeDates[0] integerValue] - 1 : [changeDates[0] integerValue] ;
        changeMonth = ([changeDates[1] isEqualToString:@"01"]) ? 12 : [changeDates[1] integerValue] - 1;
    } else {
        changeYear = ([changeDates[1] isEqualToString:@"12"]) ? [changeDates[0] integerValue] + 1 : [changeDates[0] integerValue] ;
        changeMonth = ([changeDates[1] isEqualToString:@"12"]) ? 1 : [changeDates[1] integerValue] + 1;
    }
    _nowDate = [CalendarMath getNSDateWithNSString:[NSString stringWithFormat:@"%ld-%ld-1", (long)changeYear, (long)changeMonth]];
    self.dates = [CalendarMath getMonthDateWithDate:_nowDate];

    self.titleLabel.text = [NSString stringWithFormat:@"%@, %ld", _monthArray[(long)[CalendarMath getDateInfoWithDate:_nowDate].month - 1], (long)[CalendarMath getDateInfoWithDate:_nowDate].year];
    [self addSubview:self.titleLabel];

    self.titleLabel.text = [NSString stringWithFormat:@"%@, %ld", _monthArray[(long)changeMonth - 1], (long)changeYear];
    [self.baseCalendarView reloadData];
}

#pragma mark - CollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dates.count;
}

#pragma mark - CollectionView Sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark - CollectionView Cell For Item At IndexPath
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSArray *datesDay = [_dates[indexPath.row] componentsSeparatedByString:@"-"];
    cell.dateLabel.text = datesDay[2];
    /*  DateLabel Text Color  */
    cell.dateLabel.textColor = ([datesDay[1] integerValue] != [CalendarMath getDateInfoWithDate:_nowDate].month) ? [UIColor colorWithRed:200 / 255.0 green:200 / 255.0 blue:200 / 255.0 alpha:1.0] : [UIColor whiteColor];
    /*  Cell userInteractionEnabled   */
    cell.userInteractionEnabled = ([datesDay[1] integerValue] == [CalendarMath getDateInfoWithDate:_nowDate].month) ? YES : NO;
    
    UIImage *image = [UIImage imageNamed:@"triangle.png"];
    CGRect rect = CGRectMake(0, 0, 50, 50);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:100 / 255.0 green:100 / 255.0 blue:100 / 255.0 alpha:0.3] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
    
    //Cell Background Image
    UIImage *cellBackgroundImage = ([datesDay[1] integerValue] != [CalendarMath getDateInfoWithDate:_nowDate].month) ? [UIImage imageNamed:@"dayblock_invalid1.png"] : ([datesDay[0] integerValue] == [CalendarMath getDateInfoWithDate:_today].year && [datesDay[1] integerValue] == [CalendarMath getDateInfoWithDate:_today].month && [datesDay[2] integerValue] == [CalendarMath getDateInfoWithDate:_today].day) ? flippedImage : [UIImage imageNamed:@"dayblock_normal1.png"];
    cell.layer.cornerRadius = CGRectGetHeight(cell.frame) / 2;
    cell.layer.masksToBounds = YES;
    cell.backgroundView = [[UIImageView alloc] initWithImage:cellBackgroundImage];

    /*  Selected Background Image  */
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dayblock_normal_s21.png"]];
    return cell;
}

#pragma mark - CollectionView Cell Size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((CGRectGetWidth(self.frame) - ItemSpace * 2) / 7, (CGRectGetHeight(self.frame) - CGRectGetMaxY(self.dateDaysLabel.frame) - ItemSpace) / 6.7);
}

#pragma mark - CollectionView Did Selected
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(calendar:didSelectAtDate:)]) {
        [self.delegate calendar:self didSelectAtDate:_dates[indexPath.row]];
    }
}

@end
