//
//  ViewController.h
//  FastestRPM
//
//  Created by Abegael Jackson on 2015-05-14.
//  Copyright (c) 2015 Abegael Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet UIImageView *speedometerNeedle;
@property (nonatomic, weak) IBOutlet UIImageView *speedometerImage;

-(IBAction)panGesture:(UIPanGestureRecognizer*)sender;

@end

