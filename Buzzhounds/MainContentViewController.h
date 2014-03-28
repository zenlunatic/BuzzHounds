//
//  MainContentViewController.h
//  Buzzhounds
//
//  Created by June Lee on 3/20/14.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FadeAnimator.h"
#import <MessageUI/MessageUI.h>

@interface MainContentViewController : UIViewController<AVAudioPlayerDelegate, UIScrollViewDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate>

- (IBAction)didTouchMainLogo:(id)sender;

@property (strong, nonatomic) IBOutlet UIWebView *UpcomingShowsWebView;
@property (strong, nonatomic) IBOutlet UIScrollView *YouTubeScrollView;
@property (nonatomic, strong) FadeAnimator *fadeAnimator;

- (IBAction)didClickDownload:(id)sender;
- (IBAction)didClickFacebook:(id)sender;
- (IBAction)didClickReverbNation:(id)sender;
- (IBAction)didClickEmail:(id)sender;
- (IBAction)didClickPresskit:(id)sender;
- (IBAction)didClickYouTube:(id)sender;

@end
