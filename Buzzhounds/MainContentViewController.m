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

- (void)viewDidLoad
{
    [super viewDidLoad];
    soundFilePath = [[NSBundle mainBundle] pathForResource:@"deathrace-hardrock" ofType:@"mp3"];
    
    NSString *fullURL = @"http://www.reverbnation.com/widget_code/html_widget/artist_2905165";
    //NSString *fullURL = @"http://www.reverbnation.com/widget_code/html_widget/artist_2905165?widget_id=52&posted_by=artist_2905165&pwc[design]=default&pwc[background_color]=%23333333&pwc[layout]=detailed&pwc[size]=fit";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webGigsView loadRequest:requestObj];
    
    [self embedYouTube];
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

- (void)embedYouTube
{
    NSString *embedHTML =[NSString stringWithFormat:@"\
                          <html><head>\
                          <style type=\"text/css\">\
                          body {\
                          background-color: transparent;\
                          color: blue;\
                          }\
                          </style>\
                          </head><body style=\"margin:0\">\
                          <iframe width=\"285\" height=\"215\" src=\"http://www.youtube.com/embed/yrwp3zZzzm0\" frameborder=\"0\"></iframe>\
                          </body></html>"];
    [_videoView loadHTMLString:embedHTML baseURL:nil];
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
@end
