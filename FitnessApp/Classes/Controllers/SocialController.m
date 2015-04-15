//
//  SocialController.m
//  Social
//
//  Created by nutc on 2015/3/26.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "SocialController.h"
#import "SocialFriendsView.h"
#import "SocialFriendsTableViewCell.h"
#import "SocialMyTeamView.h"
#import "SocialMyTeamTableViewCell.h"
#import "SocialAreaView.h"
#import "SocialAreaTableViewCell.h"

@interface SocialController ()

@property (nonatomic) SocialPage nowSocialPage;
@property (nonatomic, strong) NSArray *friendsArray;
@property (nonatomic, strong) NSArray *myTeamMumberArray;
@property (nonatomic, strong) NSArray *areaMumberArray;

@end

@implementation SocialController

- (instancetype)initWithFrame:(CGRect)frame socialPage:(SocialPage)socialPage {
    self = [super init];
    if (self) {
        self.nowSocialPage = socialPage;
        self.socialView = [[SocialView alloc] initWithFrame:frame];
        self.view = self.socialView;
        NSArray *logoImagesName = @[@"Friends", @"MyTeam", @"Ranking"];
        NSArray *titleTextArray = @[@"Friends", @"My Team", @"Rinking"];
        
        self.friendsArray = @[@{@"Name" : @"A",
                                @"Level" : @"100",
                                @"Rank" : @"1st"},
                              @{@"Name" : @"B",
                                @"Level" : @"102",
                                @"Rank" : @"2st"},
                              @{@"Name" : @"C",
                                @"Level" : @"106",
                                @"Rank" : @"3st"}];
        
        self.myTeamMumberArray = @[@{@"Name" : @"D",
                                     @"Level" : @"23",
                                     @"Rank" : @"1st"},
                                   @{@"Name" : @"E",
                                     @"Level" : @"24",
                                     @"Rank" : @"2st"},
                                   @{@"Name" : @"F",
                                     @"Level" : @"25",
                                     @"Rank" : @"3st"}];
        
        self.areaMumberArray = @[@{@"Name" : @"G",
                                   @"Level" : @"23",
                                   @"Rank" : @"4st"},
                                 @{@"Name" : @"H",
                                   @"Level" : @"24",
                                   @"Rank" : @"5st"},
                                 @{@"Name" : @"I",
                                   @"Level" : @"25",
                                   @"Rank" : @"6st"}];
        
        self.socialView.logoImageView.image = [UIImage imageNamed:logoImagesName[socialPage]];
        self.socialView.titleLabel.text = titleTextArray[socialPage];
        [self.socialView chagePage:socialPage];
        if (socialPage == SocialALLPage) {
            ((UIButton *)self.socialView.buttonsArray[0]).selected = YES;
        }
        else if (socialPage == SocialMyTeamPage) {
            ((UIButton *)self.socialView.buttonsArray[1]).selected = YES;
        }
        else if (socialPage == SocialAreaPage) {
            ((UIButton *)self.socialView.buttonsArray[3]).selected = YES;
        }
        
        for (int i = 0 ; i < self.socialView.buttonsArray.count ; i++) {
            [((UIButton *)self.socialView.buttonsArray[i]) addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        self.socialView.socialFriendsView.friendsTabelView.dataSource = self;
        self.socialView.socialMyTeamView.teamMumberTableVew.dataSource = self;
        self.socialView.socialAreaView.areaMemberTableView.dataSource = self;
        
        [self.socialView.cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
}

- (void)buttonAction:(UIButton *)button {
    self.nowSocialPage = button.tag;
    if (button.tag == 3) {
        self.nowSocialPage = SocialAreaPage;
    }
    [self.socialView chagePage:self.nowSocialPage];
    
    for (int i = 0 ; i < self.socialView.buttonsArray.count ; i++) {
        ((UIButton *)self.socialView.buttonsArray[i]).selected = NO;
    }
    ((UIButton *)self.socialView.buttonsArray[button.tag]).selected = YES;
    if (self.nowSocialPage == SocialALLPage) {
        self.socialView.socialFriendsView.friendsTabelView.dataSource = self;
        [self.socialView.socialFriendsView.friendsTabelView reloadData];
    }
    else if (self.nowSocialPage == SocialMyTeamPage) {
        self.socialView.socialMyTeamView.teamMumberTableVew.dataSource = self;
        [self.socialView.socialMyTeamView.teamMumberTableVew reloadData];
    }
    else if (self.nowSocialPage == SocialAreaPage) {
        self.socialView.socialAreaView.areaMemberTableView.dataSource = self;
        [self.socialView.socialAreaView.areaMemberTableView reloadData];
    }
    
}

- (void)cancelAction {
    [self.socialView removeFromSuperview];
    self.socialView = nil;
    [self removeFromParentViewController];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.nowSocialPage == SocialALLPage) {
        return self.friendsArray.count;
    }
    else if (self.nowSocialPage == SocialMyTeamPage) {
        return self.myTeamMumberArray.count;
    }
    else if (self.nowSocialPage == SocialAreaPage) {
        return self.areaMumberArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    if (self.nowSocialPage == SocialALLPage) {
        SocialFriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[SocialFriendsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.rankImageView.image = [UIImage imageNamed:self.friendsArray[indexPath.row][@"Rank"]];
            cell.nameLabel.text = self.friendsArray[indexPath.row][@"Name"];
            cell.levelLabel.text = self.friendsArray[indexPath.row][@"Level"];
        }
        return cell;
    }
    else if (self.nowSocialPage == SocialMyTeamPage) {
        SocialMyTeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[SocialMyTeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.rankImageView.image = [UIImage imageNamed:self.myTeamMumberArray[indexPath.row][@"Rank"]];
            cell.nameLabel.text = self.myTeamMumberArray[indexPath.row][@"Name"];
            cell.levelLabel.text = self.myTeamMumberArray[indexPath.row][@"Level"];
        }
        return cell;
    }
    else if (self.nowSocialPage == SocialAreaPage) {
        SocialAreaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[SocialAreaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.rankImageView.image = [UIImage imageNamed:self.areaMumberArray[indexPath.row][@"Rank"]];
            cell.nameLabel.text = self.areaMumberArray[indexPath.row][@"Name"];
            cell.levelLabel.text = self.areaMumberArray[indexPath.row][@"Level"];
        }
        return cell;
    }
    else {
        return nil;
    }
}




@end
