//
//  RZProgressOverlayView.m
//  test
//
//  Created by Rameez Remsudeen  on 7/28/14.
//  Copyright (c) 2014 Rameez Remsudeen . All rights reserved.
//

#import "RZProgressOverlayView.h"

@implementation RZProgressOverlayView

@synthesize count, images;


-(instancetype)createProgressViewWithImageArray:(NSArray *)array withTitle:(NSString *)string toView:(UIView *)view animated:(BOOL)animated{
    images = [NSArray arrayWithArray:array];
    count = 0;
    
    MRProgressOverlayView * oView = [MRProgressOverlayView showOverlayAddedTo:view title:string mode:MRProgressOverlayViewModeCustom animated:animated];
    MRProgressOverlayView * tv = [MRProgressOverlayView showOverlayAddedTo:view animated:animated];
    [tv dismiss:YES];
    
    oView.modeView = [[UIView alloc] initWithFrame:tv.modeView.frame];
    oView.modeView.backgroundColor = [UIColor clearColor];
    
    _loadingImage = [[UIImageView alloc] initWithFrame:tv.modeView.bounds];
    
    _loadingImage.backgroundColor = [UIColor clearColor];
    _loadingImage.opaque = NO;
    
    
    [oView.modeView addSubview:_loadingImage];
    
    
    [self rotateImageView];



    return self;
}



- (void)rotateImageView
{
    if (count == [images count]-1) {
        count = 0;
    }
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        //[_loadingImage setTransform:CGAffineTransformRotate(_loadingImage.transform, M_PI)];
        _loadingImage.layer.transform = CATransform3DConcat(_loadingImage.layer.transform, CATransform3DMakeRotation(M_PI_2,0.0,1.0,0.0));
        
    }completion:^(BOOL finished){
        if (finished) {
            ++count;
            _loadingImage.image = [UIImage imageNamed:[images objectAtIndex:count]];
            _loadingImage.layer.opaque = NO;
            _loadingImage.opaque = NO;
            [self rotateImageView];
        }
    }];
}


@end
