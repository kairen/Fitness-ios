//
//  KRAsyncImageView.h
//  DataCell
//
//  Created by KaiRen Bai on 2/9/12.
//  Copyright (c) 2012年 KaiRen.Bai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KRAsyncImageView : UIView

- (void)loadImageFromURL:(NSURL*)url key:(NSString*)key ;
- (void)loadImageFromData:(NSData*)cacheData key:(NSString*)key;
- (void)removeAllHandler;

@end
