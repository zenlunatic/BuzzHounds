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

@synthesize webView, forwardButton, backButton;
@synthesize loadFor, openLinksInSafari, showToolBar, showNavigationBar;

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
    
    activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activity.frame=CGRectMake(0, 0, 20, 20);
    activity.center=self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    //cars.iaai.com has a embedded youtube video, which requires following code to play video
    NSRange result=[request.URL.absoluteString rangeOfString:@"http://www.youtube.com"];
    if(result.length>0){
        [[UIApplication sharedApplication] openURL:request.URL];
        return NO;
    }
    
    
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
    [self.navigationController setToolbarHidden:showToolBar];
    [self.navigationController setNavigationBarHidden:showNavigationBar];
    
	backButton.enabled = [[self webView] canGoBack];
	forwardButton.enabled = [[self webView] canGoForward];
}

//-(IBAction)backAction:(id)sender
//{
//	[self.webView goBack];
//}


//-(IBAction)forwardAction:(id)sender
//{
//	[self.webView goForward];
//}

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
