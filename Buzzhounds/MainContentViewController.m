//
//  MainContentViewController.m
//  Buzzhounds
//
//  Created by June Lee on 3/20/14.
//
//

#import "MainContentViewController.h"
#import "WebViewController.h"


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
    
    _UpcomingShowsWebView.layer.cornerRadius = 10;
    for (UIView* subview in _UpcomingShowsWebView.subviews)
        subview.layer.cornerRadius = 10;
    
    _UpcomingShowsWebView.layer.shadowColor = [UIColor blackColor].CGColor;
    _UpcomingShowsWebView.layer.shadowOpacity = 0.7f;
    _UpcomingShowsWebView.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    _UpcomingShowsWebView.layer.shadowRadius = 5.0f;
    _UpcomingShowsWebView.layer.masksToBounds = NO;
    //UIBezierPath *path = [UIBezierPath bezierPathWithRect:_label.bounds];
    //_UpcomingShowsWebView.layer.shadowPath = path.CGPath;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _YouTubeScrollView.contentSize = CGSizeMake(2520, 158);
    _YouTubeScrollView.backgroundColor = [UIColor clearColor];

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
            if ([[UIApplication sharedApplication] canOpenURL:facebookURL]) {
                [[UIApplication sharedApplication] openURL:facebookURL];
            } else {
                [self performSegueWithIdentifier: @"FacebookSegue" sender:self];
            }
    
}

- (IBAction)didClickEmail:(id)sender {
    
    NSString* welcome = @"<p>Welcome to The BuzzHounds.</p>";
    NSString* message = @"<p> For more information about the BuzzHounds:</p>";
    NSString* facebook = @"<p><a href=\"http://www.facebook.com/buzzhounds\">Buzzhounds Facebook</a>  </p>";
    NSString* presskit = @"<p><a href=\"http://www.sonicbids.com/band/thebuzzhounds\">Buzzhounds Presskit</a></p>";
    NSString* bandpage = @"<p><a href=\"http://www.buzzhounds.net\">Buzzhounds Website</a> </p>";
    NSString* youtube = @"<p><a href=\"http://www.youtube.com/user/kudathecat\">Buzzhounds Youtube</a> </p>";
    NSString* reverbNation = @"<p><a href=\"http://www.reverbnation.com/thebuzzhounds\">Reverb Nation</a> </p>";
    
    
    NSString *body = [NSString stringWithFormat:@"<html><body>%@<br /><br />%@%@%@%@%@%@</body></html>", welcome, message, facebook, presskit, bandpage, youtube, reverbNation];
    
    MFMailComposeViewController *emailer = [[MFMailComposeViewController alloc] init];
    emailer.mailComposeDelegate = self;
    [emailer setSubject:@"Buzzhounds"];
    [emailer setMessageBody:body isHTML:YES];

    
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
