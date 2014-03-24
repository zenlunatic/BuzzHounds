//
//  MainContentViewController.m
//  Buzzhounds
//
//  Created by June Lee on 3/20/14.
//
//

#import "MainContentViewController.h"

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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _YouTubeScrollView.contentSize = CGSizeMake(2520, 158);
    _YouTubeScrollView.backgroundColor = [UIColor clearColor];

    soundFilePath = [[NSBundle mainBundle] pathForResource:@"deathrace-hardrock" ofType:@"mp3"];
    
    NSString *fullURL = @"http://www.reverbnation.com/widget_code/html_widget/artist_2905165";
    //NSString *fullURL = @"http://www.reverbnation.com/widget_code/html_widget/artist_2905165?widget_id=52&posted_by=artist_2905165&pwc[design]=default&pwc[background_color]=%23333333&pwc[layout]=detailed&pwc[size]=fit";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webGigsView loadRequest:requestObj];
    
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
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://facebook.com"]];
    }
}



#pragma mark - Navigation Delegate


// Report who is in charge of the animation
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UITabBarController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if (!self.fadeAnimator) {
        self.fadeAnimator = [FadeAnimator new];
    }
    return self.fadeAnimator;
}



@end
