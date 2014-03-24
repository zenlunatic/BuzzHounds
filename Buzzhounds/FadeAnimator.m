//
//  FadeAnimator.m
//  SprintCards.Internal
//
//  Created by June Lee on 3/10/14.
//
//

#import "FadeAnimator.h"
#define DURATION .5


@implementation FadeAnimator


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return DURATION;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *container = transitionContext.containerView;
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = toVC.view;
    
    UIView *snapshot = [toView snapshotViewAfterScreenUpdates:YES];
    [snapshot setAlpha:0.0];
    
    // Add the snapshot!
    [container addSubview:snapshot];
    [UIView animateWithDuration:DURATION
                     animations:^(){
                         [snapshot setAlpha:1.0];
                     } completion:^ (BOOL finished) {
                         if ([transitionContext transitionWasCancelled]) {
                             [snapshot removeFromSuperview];
                             [transitionContext completeTransition:NO];
                             return;
                         }
                         // Demo: Important to add this
                         [container addSubview:toView];
                         
                         [transitionContext completeTransition:YES];
                     }];
}

@end
