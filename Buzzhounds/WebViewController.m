//
//  WebViewController.m
//  Buzzhounds
//
//  Created by June Lee on 3/27/14.
//
//

#import "WebViewController.h"

@interface WebViewController ()

@end



@implementation WebViewController

@synthesize webView, forwardButton, backButton, goBackButton, activityButton;
@synthesize loadurl, openLinksInSafari;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self.navigationController setNavigationBarHidden:YES];
    
    activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activity.frame=CGRectMake(0, 0, 20, 20);
    activity.center=self.view.center;
    
    [activityButton setCustomView:activity];
    
    activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activity.frame=CGRectMake(0, 0, 20, 20);
    activity.center=self.view.center;
    
    [activityButton setCustomView:activity];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    [btn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"bhSHIRTmock_crop.png"] forState:UIControlStateNormal];
    [goBackButton setCustomView:btn];
    
    [self updateBars];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    //we have a transulcent bar for other pages
    //[self.navigationController.toolbar setBarStyle:UIBarStyleBlack];
    [self.navigationController setToolbarHidden:NO];
    
    NSURL *url;
    url=[NSURL URLWithString:loadurl];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    if(navigationType == UIWebViewNavigationTypeLinkClicked && openLinksInSafari){
        [[UIApplication sharedApplication] openURL:request.URL];
        return NO;
    }
    else {
        return YES;
    }
}


- (void)webViewDidStartLoad:(UIWebView*)webView
{
    [activity startAnimating];
    [self updateBars];
}


- (void)webViewDidFinishLoad:(UIWebView*)webView {
    [self updateBars];
    [activity stopAnimating];
}


- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
	[self webViewDidFinishLoad:[self webView]];
}


#pragma Private methods

-(void)updateBars {

	backButton.enabled = [[self webView] canGoBack];
	forwardButton.enabled = [[self webView] canGoForward];
}


-(IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (IBAction)didClickFoward:(id)sender {
    [self.webView goForward];
}

- (IBAction)didClickBack:(id)sender {
    [self.webView goBack];
}
@end
