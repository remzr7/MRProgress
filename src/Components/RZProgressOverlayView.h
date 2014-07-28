//
//  RZProgressOverlayView.h
//  test
//
//  Created by Rameez Remsudeen  on 7/28/14.
//  Copyright (c) 2014 Rameez Remsudeen . All rights reserved.
//

#import "MRProgressOverlayView.h"

@interface RZProgressOverlayView : MRProgressOverlayView

@property (strong, nonatomic)  UIImageView *loadingImage;

@property (strong, nonatomic)  NSArray *images;

@property ( nonatomic)  NSInteger count;


-(instancetype) createProgressViewWithImageArray: (NSArray *) array withTitle: (NSString *) string toView:(UIView *) view animated:(BOOL) animated;


@end
