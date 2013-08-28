//
//  ViewController.m
//  ImageHop
//
//  Created by Hendy Ou on 13-2-26.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSMutableArray *hopAnimation = [NSMutableArray arrayWithCapacity: 20];
    for (int i = 1; i <= 20; i++) {
        [hopAnimation addObject: [UIImage imageNamed: [NSString stringWithFormat:@"frame-%d.png",i]]];
    }
    self.bunnyViews = [NSArray arrayWithObjects:
                           self.bunnyView1,
                           self.bunnyView2,
                           self.bunnyView3,
                           self.bunnyView4,
                           self.bunnyView5,
                           nil];
    for (UIImageView *bunny in self.bunnyViews) {
        bunny.animationImages = hopAnimation;
        bunny.animationDuration = [self secondsPerHop];
    }
    
    [self showSpeed];
    
    self.speedStepper.maximumValue = self.speedSlider.maximumValue;
    self.speedStepper.minimumValue = self.speedSlider.minimumValue;
    self.speedStepper.value = self.speedSlider.value;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchUpSlider:(id)sender {
    [self startAnimating];
}

- (IBAction)setSpeed:(id)sender {
    [self showSpeed];
    self.bunnyView1.animationDuration = [self secondsPerHop];
    self.bunnyView2.animationDuration = [self secondsPerHop] + rand() % 11 / 10.0;
    self.bunnyView3.animationDuration = [self secondsPerHop] + rand() % 11 / 10.0;
    self.bunnyView4.animationDuration = [self secondsPerHop] + rand() % 11 / 10.0;
    self.bunnyView5.animationDuration = [self secondsPerHop] + rand() % 11 / 10.0;
    self.speedStepper.value = self.speedSlider.value;
}

- (IBAction)setIncrement:(id)sender {
    self.speedSlider.value = self.speedStepper.value;
    [self setSpeed: nil];
    [self startAnimating];
}

- (IBAction)toggleAnimation:(id)sender {
    if (self.bunnyView1.isAnimating) {
        [self stopAnimationg];
    } else {
        [self startAnimating];
    }

}

- (void)startAnimating
{
    for (UIImageView *bunny in self.bunnyViews) {
        [bunny startAnimating];
    }
    [self.toggleButton setTitle: @"Sit Still!!" forState: UIControlStateNormal];
}

- (void)stopAnimationg
{
    for (UIImageView *bunny in self.bunnyViews) {
        [bunny stopAnimating];
    }
    [self.toggleButton setTitle: @"Hop!!" forState: UIControlStateNormal];
}

- (float)secondsPerHop
{
    return self.speedSlider.maximumValue + self.speedSlider.minimumValue - self.speedSlider.value;
}

- (void)showSpeed
{
    self.hopsPerSecond.text = [NSString stringWithFormat:@"%.2f hps", 1/[self secondsPerHop]];

}

@end
