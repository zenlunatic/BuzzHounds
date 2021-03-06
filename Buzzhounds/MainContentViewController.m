//
//  MainContentViewController.m
//  Buzzhounds
//
//  Created by June Lee on 3/20/14.
//
//

#import "MainContentViewController.h"
#import "WebViewController.h"
#import "PicViewController.h"


@interface MainContentViewController ()

@end

@implementation MainContentViewController
{
    AVAudioPlayer *audioPlayer;
    NSString *soundFilePath;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    NSString *embedHTML = @"<div class=\"widget_iframe\" style=\"display:inline-block;width:100%;height:100%;margin:0;padding:0;border:0;\"><iframe class=\"widget_iframe\" src=\"http://www.reverbnation.com/widget_code/html_widget/artist_2905165?widget_id=52&pwc[design]=default&pwc[background_color]=%23333333&pwc[layout]=compact&pwc[show_map]=0&pwc[size]=custom\" width=\"100%\" height=\"100%\" frameborder=\"0\" scrolling=\"no\"></iframe></div>";
    
    [_UpcomingShowsWebView loadHTMLString:embedHTML baseURL:nil];
    _UpcomingShowsWebView.scrollView.showsHorizontalScrollIndicator = NO;
    _UpcomingShowsWebView.scrollView.showsVerticalScrollIndicator = NO;
    
}

- (void)shadowView:(UIView *)view
{
    view.layer.cornerRadius = 10;
    for (UIView* subview in view.subviews)
        subview.layer.cornerRadius = 10;
    
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.7f;
    view.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    view.layer.shadowRadius = 5.0f;
    view.layer.masksToBounds = NO;
    //UIBezierPath *path = [UIBezierPath bezierPathWithRect:_label.bounds];
    //_UpcomingShowsWebView.layer.shadowPath = path.CGPath;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _YouTubeScrollView.contentSize = CGSizeMake(2490, 158);
    _YouTubeScrollView.backgroundColor = [UIColor clearColor];
    
    [self shadowView:_UpcomingShowsWebView];
    [self shadowView:_YouTubeScrollView];
    [self shadowView:_albumImage];
    [self shadowView:_BandBioImage];
    [self shadowView:_BuzzhoundsWebsiteImage];
    //[self shadowView:_emailIcon];

    soundFilePath = [[NSBundle mainBundle] pathForResource:@"deathrace-hardrock" ofType:@"mp3"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)didTouchMainLogo:(id)sender {
    if (audioPlayer == nil)
    {
        
        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
        
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        [[AVAudioSession sharedInstance] setActive: YES error: nil];
        
        [audioPlayer play];
    }
    else
    {
        if (audioPlayer.isPlaying)
        {
            [audioPlayer pause];
        }
        else
        {
            [audioPlayer play];
        }
    }

}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type == UIEventSubtypeMotionShake) {
        
        if (!audioPlayer.isPlaying)
        {
            if ([soundFilePath rangeOfString:@"death"].location == NSNotFound)
            {
                soundFilePath = [[NSBundle mainBundle] pathForResource:@"deathrace-hardrock" ofType:@"mp3"];
                NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
                AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
                AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Death Race"];
                [utterance setRate:.2f];
                [synthesizer speakUtterance:utterance];
            }
            else
            {
                soundFilePath = [[NSBundle mainBundle] pathForResource:@"standup" ofType:@"mp3"];
                NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
                AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
                AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Stand up"];
                [utterance setRate:.2f];
                [synthesizer speakUtterance:utterance];
            }
        }
    }
    
}

- (IBAction)didClickDownload:(id)sender {
    NSString *downloadURL = @"https://itunes.apple.com/us/album/weapons-of-mass-seduction/id597662543";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:downloadURL]];
}

- (IBAction)didClickFacebook:(id)sender {
    
            NSURL *facebookURL = [NSURL URLWithString:@"fb://profile/350835098300811"];
    
            if ([[UIApplication sharedApplication] canOpenURL:facebookURL])
            {
                [[UIApplication sharedApplication] openURL:facebookURL];
            }
            else
            {
                [self performSegueWithIdentifier: @"FacebookSegue" sender:self];
            }
    
}

- (IBAction)didClickEmail:(id)sender {
    
    NSString* welcome = @"<p>Welcome to The BuzzHounds.</p>";
    NSString* message = @"<p> For more information about the BuzzHounds:</p>";
    NSString* facebook = @"<p><a href=\"http://www.facebook.com/buzzhounds\">BuzzHounds on Facebook</a>  </p>";
    NSString* presskit = @"<p><a href=\"http://www.sonicbids.com/band/thebuzzhounds\">BuzzHounds on Presskit</a></p>";
    NSString* bandpage = @"<p><a href=\"http://www.buzzhounds.net\">BuzzHounds Website</a> </p>";
    NSString* youtube = @"<p><a href=\"http://www.youtube.com/user/kudathecat\">BuzzHounds on Youtube</a> </p>";
    NSString* reverbNation = @"<p><a href=\"http://www.reverbnation.com/thebuzzhounds\">BuzzHounds on Reverb Nation</a> </p>";
    
    
    NSString *body = [NSString stringWithFormat:@"<html><body>%@<br /><br />%@%@%@%@%@%@</body></html>", welcome, message, bandpage, facebook, presskit, youtube, reverbNation];
    
    MFMailComposeViewController *emailer = [[MFMailComposeViewController alloc] init];
    emailer.mailComposeDelegate = self;
    [emailer setSubject:@"Buzzhounds"];
    [emailer setMessageBody:body isHTML:YES];

    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        emailer.modalPresentationStyle = UIModalPresentationPageSheet;
    }
    [self presentViewController:emailer animated:YES completion:nil];
    
}

- (IBAction)didClickRefreshUpcomngShows:(id)sender {
    
    NSString *embedHTML = @"<div class=\"widget_iframe\" style=\"display:inline-block;width:100%;height:100%;margin:0;padding:0;border:0;\"><iframe class=\"widget_iframe\" src=\"http://www.reverbnation.com/widget_code/html_widget/artist_2905165?widget_id=52&pwc[design]=default&pwc[background_color]=%23333333&pwc[layout]=compact&pwc[show_map]=0&pwc[size]=custom\" width=\"100%\" height=\"100%\" frameborder=\"0\" scrolling=\"no\"></iframe></div>";
    
    [_UpcomingShowsWebView loadHTMLString:embedHTML baseURL:nil];
    _UpcomingShowsWebView.scrollView.showsHorizontalScrollIndicator = NO;
    _UpcomingShowsWebView.scrollView.showsVerticalScrollIndicator = NO;
    
}

- (IBAction)didClickRefreshVideos:(id)sender {
    PicViewController *pic = (PicViewController *)self.childViewControllers[0];
    [pic loadVideos];
}

- (IBAction)didClickEmailButton:(id)sender {
    
    NSString* welcome = @"<p>Hey,</p>";
    NSString* message = @"<p> Tell me more about the band or the BuzzHounds app. </p>";
    
    NSString *body = [NSString stringWithFormat:@"<html><body>%@<br /><br />%@</body></html>", welcome, message];
    
    MFMailComposeViewController *emailer = [[MFMailComposeViewController alloc] init];
    emailer.mailComposeDelegate = self;
    
    NSArray *toRecipents = [NSArray arrayWithObject:@"junelee1974@yahoo.com"];
   // NSArray *BccRecipents = [NSArray arrayWithObject:@"junelee1974@yahoo.com"];

    [emailer setSubject:@"Buzzhounds iPhone App"];
    [emailer setMessageBody:body isHTML:YES];
    [emailer setToRecipients:toRecipents];
  //  [emailer setBccRecipients:BccRecipents];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        emailer.modalPresentationStyle = UIModalPresentationPageSheet;
    }
    [self presentViewController:emailer animated:YES completion:nil];

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    if (result == MFMailComposeResultFailed) {
        [self showMessage:@"Email failed to send. Please try again."];
    }
	[self dismissViewControllerAnimated:YES completion:nil];
}

-(void) showMessage: (NSString*)message
{
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = _YouTubeScrollView.frame.size.width;
    int page = floor((_YouTubeScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _videoPageControl.currentPage = page;
    
}
#pragma mark - Navigation Delegate


// Report who is in charge of the animation
//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                  animationControllerForOperation:(UINavigationControllerOperation)operation
//                                               fromViewController:(UITabBarController *)fromVC
//                                                 toViewController:(UIViewController *)toVC
//{
//    if (!self.fadeAnimator) {
//        self.fadeAnimator = [FadeAnimator new];
//    }
//    return self.fadeAnimator;
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"BuzzhoundsSegue"]) {
         WebViewController *vc = [segue destinationViewController];
         vc.loadurl = @"http://www.buzzhounds.net";
    }
    else if ([[segue identifier] isEqualToString:@"FacebookSegue"])
    {
        WebViewController *vc = [segue destinationViewController];
        vc.loadurl = @"http://facebook.com/buzzhounds";
    }
    else if ([[segue identifier] isEqualToString:@"YoutubeSegue"])
    {
        WebViewController *vc = [segue destinationViewController];
        vc.loadurl = @"http://www.youtube.com/user/kudathecat";
    }
    else if ([[segue identifier] isEqualToString:@"PresskitSegue"])
    {
        WebViewController *vc = [segue destinationViewController];
        vc.loadurl = @"http://www.sonicbids.com/band/thebuzzhounds";
    }
    else if ([[segue identifier] isEqualToString:@"ReverbNationSegue"])
    {
        WebViewController *vc = [segue destinationViewController];
        vc.loadurl = @"http://www.reverbnation.com/thebuzzhounds";
    }
}




@end
