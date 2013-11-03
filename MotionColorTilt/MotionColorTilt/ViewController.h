//
//  ViewController.h
//  MotionColorTilt
//
//  Created by Hendy Ou on 13-10-25.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
{
    @private
    CMMotionManager *_motionManager;
}

@property (strong, nonatomic) IBOutlet UISwitch *accelerometerSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *gyroscopeSwitch;
@property (strong, nonatomic) IBOutlet UIView *colorView;

- (IBAction)controlHardware:(id)sender;

@end
