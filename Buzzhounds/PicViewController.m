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

    
    NSString *embedHTML =[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: transparent;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"275\" height=\"155\" src=\"http://www.youtube.com/embed/6VtbEZHX2eA?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                          </body></html>"];
    [_webView1 loadHTMLString:embedHTML baseURL:nil];
    
    NSString *embedHTML2 =[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: transparent;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"275\" height=\"155\" src=\"http://www.youtube.com/embed/yrwp3zZzzm0?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                          </body></html>"];

    [_webView2 loadHTMLString:embedHTML2 baseURL:nil];
    
    NSString *embedHTML3 =[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: transparent;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"275\" height=\"155\" src=\"http://www.youtube.com/embed/6VtbEZHX2eA?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                          </body></html>"];
    [_webView3 loadHTMLString:embedHTML3 baseURL:nil];
    
    NSString *embedHTML4 =[NSString stringWithFormat:@"\
                           <html><head>\
                           <style type=\"text/css\">\
                           body {\
                           background-color: transparent;\
                           color: transparent;\
                           }\
                           </style>\
                           </head><body style=\"margin:0\">\
                           <iframe width=\"275\" height=\"155\" src=\"http://www.youtube.com/embed/yrwp3zZzzm0?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                           </body></html>"];
    
    [_webView4 loadHTMLString:embedHTML4 baseURL:nil];
    
    NSString *embedHTML5=[NSString stringWithFormat:@"\
                           <html><head>\
                           <style type=\"text/css\">\
                           body {\
                           background-color: transparent;\
                           color: transparent;\
                           }\
                           </style>\
                           </head><body style=\"margin:0\">\
                           <iframe width=\"275\" height=\"155\" src=\"http://www.youtube.com/embed/6VtbEZHX2eA?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                           </body></html>"];
    [_webView5 loadHTMLString:embedHTML5 baseURL:nil];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
