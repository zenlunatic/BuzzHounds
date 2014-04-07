//
//  PicViewController.h
//  Buzzhounds
//
//  Created by June Lee on 3/21/14.
//
//

#import <UIKit/UIKit.h>

@interface PicViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView1;
@property (strong, nonatomic) IBOutlet UIWebView *webView2;
@property (strong, nonatomic) IBOutlet UIWebView *webView3;
@property (strong, nonatomic) IBOutlet UIWebView *webView4;
@property (strong, nonatomic) IBOutlet UIWebView *webView5;
@property (strong, nonatomic) IBOutlet UIWebView *webView6;
@property (strong, nonatomic) IBOutlet UIWebView *webView7;
@property (strong, nonatomic) IBOutlet UIWebView *webView9;


- (void) loadVideos;

@end
