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
                          <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/6VtbEZHX2eA?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
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
                          <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/2Xu5P3wJIug?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
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
                          <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/kANZmJYMw3o?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
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
                           <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/Y_EtZqW4tCI?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
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
                           <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/exEj-bTBNtg?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                           </body></html>"];
    [_webView5 loadHTMLString:embedHTML5 baseURL:nil];
    
    NSString *embedHTML6=[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: transparent;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/vqchR8GGZB8?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                          </body></html>"];
    [_webView6 loadHTMLString:embedHTML6 baseURL:nil];
    
    NSString *embedHTML7=[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: transparent;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/Cnb6XJvzOWc?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                          </body></html>"];
    [_webView7 loadHTMLString:embedHTML7 baseURL:nil];
    
    

    NSString *embedHTML8=[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: transparent;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/624xlZNx2Aw?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                          </body></html>"];
    [_webView8 loadHTMLString:embedHTML8 baseURL:nil];

    

    NSString *embedHTML9=[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: transparent;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/yrwp3zZzzm0?rel=0&showinfo=0\" frameborder=\"0\"></iframe>\
                          </body></html>"];
    [_webView9 loadHTMLString:embedHTML9 baseURL:nil];
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
