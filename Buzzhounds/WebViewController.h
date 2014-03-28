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

@property (strong, nonatomic) NSString* loadFor;
@property BOOL openLinksInSafari;
@property BOOL showToolBar;
@property BOOL showNavigationBar;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)didClickFoward:(id)sender;
- (IBAction)didClickBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardButton;

@end
