//
//  MainContentViewController.h
//  Buzzhounds
//
//  Created by June Lee on 3/20/14.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainContentViewController : UIViewController<AVAudioPlayerDelegate, UIScrollViewDelegate>

- (IBAction)didTouchMainLogo:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webGigsView;
@property (strong, nonatomic) IBOutlet UIScrollView *YouTubeScrollView;


@end
