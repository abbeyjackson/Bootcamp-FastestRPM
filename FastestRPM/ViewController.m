//
//  ViewController.m
//  FastestRPM
//
//  Created by Abegael Jackson on 2015-05-14.
//  Copyright (c) 2015 Abegael Jackson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.speedometerNeedle.layer.anchorPoint = CGPointMake(.28,.47);
    //  anchorPoint moves the layer also so must offset using .center or in the storyboard.
    
    self.speedometerNeedle.transform = CGAffineTransformMakeRotation(2.42);
    
}


-(IBAction)panGesture:(UIPanGestureRecognizer*)sender{
    sender.maximumNumberOfTouches = 1;
    
    CGPoint velocityVector = [sender velocityInView:self.view];
    //this returns two velocities, one for the x direction and one for the y direction
    
    CGFloat velocityAbsolute = sqrt((velocityVector.x * velocityVector.x) + (velocityVector.y * velocityVector.y));
    
    // max velocity determined to be 7000px/s
    float velocityMax = 4000.0;
//    float velocityPerRad = velocityMax * 2*M_PI;
    float angleOfSpeedometerNeedleInRads = (velocityAbsolute / velocityMax) * 4.7;
    
//    float angle = ((velocityAbsolute / velocityMax) * 2 * M_PI) + 2.42;
    
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.speedometerNeedle.transform = CGAffineTransformMakeRotation(2.42);
    }
    else if (sender.state == UIGestureRecognizerStateBegan || sender.state == UIGestureRecognizerStateChanged){
        self.speedometerNeedle.transform = CGAffineTransformMakeRotation(angleOfSpeedometerNeedleInRads + 2.42);
    }
    
    
    NSLog(@"Velocity: %f", angleOfSpeedometerNeedleInRads);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
