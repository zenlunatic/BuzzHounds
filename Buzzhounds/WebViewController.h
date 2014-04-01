//
//  WebViewController.h
//  Buzzhounds
//
//  Created by June Lee on 3/27/14.
//
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate> {
    UIActivityIndicatorView* activity;
}

@property (strong, nonatomic) NSString* loadurl;
@property BOOL openLinksInSafari;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)didClickFoward:(id)sender;
- (IBAction)didClickBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *goBackButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *activityButton;

@end
