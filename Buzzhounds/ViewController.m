




//
//  ViewController.m
//  core-background
//
//  Created by JUSTIN M FISCHER on 6/28/13.
//  Copyright (c) 2013 Justin M Fischer. All rights reserved.
//

#import "ViewController.h"
#import "CBG.h"
#import "UIImage+ImageEffects.h"

//Timer
#define kTimerIntervalInSeconds 10

@interface ViewController ()

@end

@implementation ViewController


-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}


- (void) viewDidLoad {
    
    [super viewDidLoad];

    self.scrollView.contentSize = CGSizeMake(320, 2500);
    
    //Initial photos
    CBGPhotos *photos = [[CBGPhotos alloc] init];
    photos.photo = [UIImage imageNamed: @"000-Buzz.jpg"];
    photos.photoWithEffects = [photos.photo applyLightEffect];
    [self crossDissolvePhotos:photos withTitle:@""];
    
    //Retrieve location and content from Flickr
    [self retrieveLocationAndUpdateBackgroundPhoto];
    
//    //Schedule updates
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kTimerIntervalInSeconds target:self selector:@selector(retrieveLocationAndUpdateBackgroundPhoto)userInfo:nil repeats:YES];
}

- (void) retrieveLocationAndUpdateBackgroundPhoto {
    
    //Flickr
    [[CBGFlickrManager sharedManager] randomPhotoRequest:^(FlickrRequestInfo * flickrRequestInfo, NSError * error) {
        
        if(!error) {
            self.userPhotoWebPageURL = flickrRequestInfo.userPhotoWebPageURL;
            
            [self crossDissolvePhotos:flickrRequestInfo.photos withTitle:flickrRequestInfo.userInfo];
            [self.activityIndicator stopAnimating];
        } else {
            
            
            [[CBGStockPhotoManager sharedManager] randomStockPhoto:^(CBGPhotos * photos) {
                [self crossDissolvePhotos:photos withTitle:@""];
            }];
            
            [self.activityIndicator stopAnimating];
            
            NSLog(@"Flickr: %@", error.description);
        }
    }];

    
}

- (void) crossDissolvePhotos:(CBGPhotos *) photos withTitle:(NSString *) title {
    [UIView transitionWithView:self.backgroundPhoto duration:4.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        self.backgroundPhoto.image = photos.photo;
        self.backgroundPhotoWithImageEffects.image = photos.photoWithEffects;
        self.photoUserInfoBarButton.title = title;
        
    } completion:NULL];
}

- (IBAction) launchFlickrUserPhotoWebPage:(id) sender {
    if([self.photoUserInfoBarButton.title  length] > 0) {
        [[UIApplication sharedApplication] openURL:self.userPhotoWebPageURL];
    }
}

- (IBAction)didTouchView:(id)sender {
    if(self.scrollView.contentOffset.y == 0)
    {
         [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 390) animated:YES];
    }
    else  if(self.scrollView.contentOffset.y == 390){
         [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 0) animated:YES];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    float settingDissolve = 500.0;
    
    if(scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y <= settingDissolve) {
        
        float percent = (scrollView.contentOffset.y / settingDissolve);
        self.backgroundPhotoWithImageEffects.alpha = percent;
        self.backgroundPhoto.alpha = 100- percent;
        
    } else if (scrollView.contentOffset.y > settingDissolve){
        //self.backgroundPhotoWithImageEffects.alpha = 0;
        self.backgroundPhoto.alpha = 0;
    } else if (scrollView.contentOffset.y < 0) {
        self.backgroundPhotoWithImageEffects.alpha = 0;
        self.backgroundPhoto.alpha = 1;
    }
}




@end
