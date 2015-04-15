//
//  KRAsyncImageView.m
//  DataCell
//
//  Created by KaiRen Bai on 2/9/12.
//  Copyright (c) 2012年 KaiRen.Bai. All rights reserved.
//

#import "KRAsyncImageView.h"

@interface KRAsyncImageView () <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableArray *images;
    UIActivityIndicatorView *indicatorView;
    UIImageView *imageView;
}
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData	 *data;

@property (nonatomic, strong) NSString	*filePath;
@property (nonatomic, strong) NSString	*imageName;
@end

@implementation KRAsyncImageView

- (NSString*)filePath
{
	if (!_filePath) {
		NSString *imageCachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
		self.filePath = [imageCachePath stringByAppendingPathComponent:self.imageName];
	}
	return _filePath;
}

#pragma mark - Remove All Data and Handler
-(void) removeAllHandler
{
    [self animationDidFinish];
    [self prepareForLoad];
}

-(void) removeIndicatorView
{
    [indicatorView stopAnimating];
    [indicatorView removeFromSuperview];
    indicatorView = nil;
}

- (void) removeSubViews
{
    [self removeIndicatorView];
    for(UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    imageView.image = nil;
    imageView = nil;
    self.imageName = nil;
    self.filePath = nil;
}

- (void) prepareForLoad
{
    [_connection cancel];
    _connection = nil;
    _data = nil;

    [self removeSubViews];
}

-(void) animationDidFinish
{
    [imageView stopAnimating];
    images = nil;
    imageView.animationImages = nil;
}

#pragma mark - Loading Method URL and Data
- (void)loadImageFromData:(NSData*)cacheData  key:(NSString*)key
{
    [self prepareForLoad];
    UIImage *reSizeImage;
    
    if (key) {
        self.imageName = [NSString stringWithFormat:@"%ix%i%@.%@",(int)CGRectGetWidth(self.bounds),(int)CGRectGetWidth(self.bounds),key,@"jpg"];
    }
    
    if([UIImage imageWithContentsOfFile:self.filePath]) {
        reSizeImage = [UIImage imageWithContentsOfFile:self.filePath];
    } else {
        if(cacheData) {
            UIImage *image = [UIImage imageWithData:cacheData];
            CGFloat scale = (CGRectGetWidth(self.bounds) / image.size.width) * 2;
            reSizeImage = [image resize:CGSizeMake(image.size.width * scale, image.size.height * scale)];
            NSData *data = UIImageJPEGRepresentation(reSizeImage, 1.0);
            [data writeToFile:self.filePath atomically:YES];
            data = nil;
        } else {
            reSizeImage = [UIImage loadFileImageName:@"loadingFailed.png"];
        }
    }
    imageView = [[UIImageView alloc]initWithImage:reSizeImage];
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight );
            [self addSubview:imageView];
            imageView.frame = self.bounds;
            [imageView setNeedsLayout];
            [self setNeedsLayout];
        });
    });
    
    reSizeImage = nil;
}
- (void)loadImageFromURL:(NSURL*)url key:(NSString*)key
{
    [self prepareForLoad];

    NSString *lastKey = [[url.absoluteString componentsSeparatedByString:@"/"] lastObject];
    NSString *imageType = [[lastKey componentsSeparatedByString:@"."] lastObject];
    
    if (key) {
        self.imageName = [NSString stringWithFormat:@"%ix%i%@.%@",(int)CGRectGetWidth(self.bounds),(int)CGRectGetWidth(self.bounds),key,imageType];
    }
    imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    imageView.opaque = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    [self addSubview:imageView];

    if([UIImage imageWithContentsOfFile:self.filePath]) {
        imageView.image = [UIImage imageWithContentsOfFile:self.filePath];
    } else {
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicatorView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        [self addSubview:indicatorView];
        [indicatorView startAnimating];
    }
}

#pragma mark - Connection Delegate Method
- (void)connection:(NSURLConnection *)theConnection	didReceiveData:(NSData *)data
{
    if(!self.data) {
        self.data = [NSMutableData data];
    }
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection
{
    [self removeIndicatorView];
    UIImage *image = [UIImage imageWithData:self.data];

    CGFloat scale = CGRectGetWidth(self.bounds) / image.size.width;
    CGSize size = CGSizeMake(image.size.width * scale, image.size.height * scale);
    UIImage *reSizeImage = [image resize:size];
    
    imageView.image = reSizeImage;;
    if(reSizeImage) {
        images = [NSMutableArray array];
        for(int i = 10;  i >= 1 ; i--) {
            [images addObject:[reSizeImage boxblurImageWithBlur:i * 0.1]];
        }
        imageView.animationDuration = 1.0;
        imageView.animationImages = images;
        imageView.animationRepeatCount = 1;
        [imageView startAnimating];
    }
    typeof(self) weakSelf = self;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, imageView.animationDuration * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [weakSelf animationDidFinish];
    });
    
    NSData *data = UIImageJPEGRepresentation(reSizeImage, 1.0);
    [data writeToFile:self.filePath atomically:YES];
    data = nil;
    self.data = nil;
    images = nil;
    reSizeImage = nil;
    image = nil;
    _connection = nil;
}

- (void)connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error
{
    [self removeIndicatorView];
    imageView.image = [UIImage loadFileImageName:@"loadingFailed.png"];
    self.data = nil;
    images = nil;
    _connection = nil;
}

@end
