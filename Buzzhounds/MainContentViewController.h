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

@interface MainContentViewController : UIViewController<AVAudioPlayerDelegate, UIScrollViewDelegate, UINavigationControllerDelegate>

- (IBAction)didTouchMainLogo:(id)sender;

@property (strong, nonatomic) IBOutlet UIWebView *webGigsView;
@property (strong, nonatomic) IBOutlet UIScrollView *YouTubeScrollView;
@property (nonatomic, strong) FadeAnimator *fadeAnimator;

- (IBAction)didClickDownload:(id)sender;
- (IBAction)didClickFacebook:(id)sender;
- (IBAction)didClickReverbNation:(id)sender;

@end
