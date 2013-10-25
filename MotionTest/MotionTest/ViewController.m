//
//  ViewController.m
//  MotionTest
//
//  Created by Hendy Ou on 13-10-24.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    NSLog(@"dealloc");
}

- (void)orientationChange:(NSNotification *)notification
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    
    NSString *orientationStr = @"Unknown";
    switch (orientation) {
        case UIDeviceOrientationFaceUp:
            orientationStr = @"Face Up";
            break;
        case UIDeviceOrientationFaceDown:
            orientationStr = @"Face Down";
            break;
        case UIDeviceOrientationPortrait:
            orientationStr = @"Portrait";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            orientationStr = @"Portrait UpsideDown";
            break;
        case UIDeviceOrientationLandscapeLeft:
            orientationStr = @"Landscape Left";
            break;
        case UIDeviceOrientationLandscapeRight:
            orientationStr = @"Landscape Right";
            break;
        default:
            break;
    }
    NSLog(@"%@", orientationStr);
    _orientationLabel.text = orientationStr;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
