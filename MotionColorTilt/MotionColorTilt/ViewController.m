//
//  ViewController.m
//  MotionColorTilt
//
//  Created by Hendy Ou on 13-10-25.
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
    
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.accelerometerUpdateInterval = .01;
    _motionManager.gyroUpdateInterval = 0.01;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)controlHardware:(id)sender {
    //Accelerometer
    if (_accelerometerSwitch.isOn) {
        [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            [self doAcceleration:accelerometerData.acceleration];
        }];
    } else {
        [_motionManager stopAccelerometerUpdates];
    }
    
    //Gyroscope
    if (_motionManager.gyroAvailable && _gyroscopeSwitch.isOn) {
        [_motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
            [self doRotation:gyroData.rotationRate];
        }];
    } else {
        [_gyroscopeSwitch setOn:NO animated:YES];
        [_motionManager stopGyroUpdates];
    }
}

- (void)doAcceleration:(CMAcceleration)acceleration
{
//    NSLog(@"x:%.2f y:%.2f z:%.2f", acceleration.x, acceleration.y, acceleration.z);
    if (acceleration.x > 1.3) {
        _colorView.backgroundColor = [UIColor greenColor];
    } else if (acceleration.x < -1.3) {
        _colorView.backgroundColor = [UIColor orangeColor];
    } else if (acceleration.y > 1.3) {
        _colorView.backgroundColor = [UIColor redColor];
    } else if (acceleration.y < -1.3) {
        _colorView.backgroundColor = [UIColor blueColor];
    } else if (acceleration.z > 1.3) {
        _colorView.backgroundColor = [UIColor yellowColor];
    } else if (acceleration.z < -1.3) {
        _colorView.backgroundColor = [UIColor purpleColor];
    }
    
    double value = fabs(acceleration.x);
    if (value > 1.0) {
        value = 1.0;
    }
    _colorView.alpha = value;
}

- (void)doRotation:(CMRotationRate)rotationRate
{
//    NSLog(@"x:%.2f y:%.2f z:%.2f", rotationRate.x, rotationRate.y, rotationRate.z);
    
    double value = (fabs(rotationRate.x) + fabs(rotationRate.y) + fabs(rotationRate.z)) / 8.0;
    if (value > 1.0) {
        value = 1.0;
    }
    
    _colorView.alpha = value;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
