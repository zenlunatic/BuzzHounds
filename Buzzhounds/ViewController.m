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

    self.scrollView.contentSize = CGSizeMake(320, 2000);
    
    
    CBGPhotos *photos = [[CBGPhotos alloc] init];
    photos.photo = [UIImage imageNamed: @"BuzzHoundsClown.jpg"];
    photos.photoWithEffects = [photos.photo applyLightEffect];
    [self crossDissolvePhotos:photos withTitle:@""];
    
//    //Initial stock photos from bundle
//    [[CBGStockPhotoManager sharedManager] randomStockPhoto:^(CBGPhotos * photos) {
//        [self crossDissolvePhotos:photos withTitle:@""];
//    }];
    
//    //Retrieve location and content from Flickr
//    [self retrieveLocationAndUpdateBackgroundPhoto];
//    
//    //Schedule updates
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:kTimerIntervalInSeconds target:self selector:@selector(retrieveLocationAndUpdateBackgroundPhoto)userInfo:nil repeats:YES];
}

- (void) retrieveLocationAndUpdateBackgroundPhoto {
    
    //Location
    [[CBGLocationManager sharedManager] locationRequest:^(CLLocation * location, NSError * error) {
        
        [self.activityIndicator startAnimating];
        
        if(!error) {
            
            //Flickr 
            [[CBGFlickrManager sharedManager] randomPhotoRequest:^(FlickrRequestInfo * flickrRequestInfo, NSError * error) {
                
                if(!error) {
                    self.userPhotoWebPageURL = flickrRequestInfo.userPhotoWebPageURL;
                    
                    [self crossDissolvePhotos:flickrRequestInfo.photos withTitle:flickrRequestInfo.userInfo];
                    [self.activityIndicator stopAnimating];
                } else {
                    
                    //Error : Stock photos
                    [[CBGStockPhotoManager sharedManager] randomStockPhoto:^(CBGPhotos * photos) {
                        [self crossDissolvePhotos:photos withTitle:@""];
                    }];
                    
                    [self.activityIndicator stopAnimating];
                    
                    NSLog(@"Flickr: %@", error.description);
                }
            }];
        } else {
            
            //Error : Stock photos
            [[CBGStockPhotoManager sharedManager] randomStockPhoto:^(CBGPhotos * photos) {
                [self crossDissolvePhotos:photos withTitle:@""];
            }];
            
            [self.activityIndicator stopAnimating];
            
            NSLog(@"Location: %@", error.description);
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    float settingDissolve = 500.0;
    
    if(scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y <= settingDissolve) {
        float percent = (scrollView.contentOffset.y / settingDissolve);
        
        self.backgroundPhotoWithImageEffects.alpha = percent;
        
    } else if (scrollView.contentOffset.y > settingDissolve){
        self.backgroundPhotoWithImageEffects.alpha = 1;
    } else if (scrollView.contentOffset.y < 0) {
        self.backgroundPhotoWithImageEffects.alpha = 0;
    }
}




@end
