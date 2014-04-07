//
//  PicViewController.m
//  Buzzhounds
//
//  Created by June Lee on 3/21/14.
//
//

#import "PicViewController.h"

@interface PicViewController ()

@end

@implementation PicViewController

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
    [self loadVideos];
}


- (void) loadVideos
{
    [self embedYoutube:_webView1 video:@"6VtbEZHX2eA"];
    [self embedYoutube:_webView2 video:@"2Xu5P3wJIug"];
    [self embedYoutube:_webView3 video:@"kANZmJYMw3o"];
    [self embedYoutube:_webView4 video:@"Y_EtZqW4tCI"];
    [self embedYoutube:_webView5 video:@"exEj-bTBNtg"];
    [self embedYoutube:_webView6 video:@"vqchR8GGZB8"];
    [self embedYoutube:_webView7 video:@"Cnb6XJvzOWc"];
    [self embedYoutube:_webView9 video:@"yrwp3zZzzm0"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void) embedYoutube:(UIWebView *)webview video:(NSString*)urlpart
{
    NSString *embedHTML=[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: transparent;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/%@?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                          </body></html>",urlpart];
    [webview loadHTMLString:embedHTML baseURL:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
   // [self.navigationController setToolbarHidden:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
