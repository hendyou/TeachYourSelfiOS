//
//  ViewController.m
//  FlowerWeb
//
//  Created by Hendy on 13-3-2.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 14, 8, 14);
    UIImage *normalImg = [[UIImage imageNamed: @"whiteButton.png"] resizableImageWithCapInsets: insets resizingMode: UIImageResizingModeStretch];
    UIImage *pressedImg = [[UIImage imageNamed: @"blueButton.png"] resizableImageWithCapInsets: insets resizingMode: UIImageResizingModeStretch];
    
    [self.flowerGetter setBackgroundImage: normalImg forState: UIControlStateNormal];
    [self.flowerGetter setBackgroundImage: pressedImg forState: UIControlStateHighlighted];
    
    self.flowerDetailView.hidden = YES;
    [self getFlower:nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleFlowerDetail:(id)sender {
    self.flowerDetailView.hidden = ![sender isOn];
}

- (IBAction)getFlower:(id)sender {
    NSURL *imageURL;
    NSURL *detailURL;
    NSString *imageURLString;
    NSString *detailURLString;
    NSString *color;
    int sessionID;
    
    color = [self.colorChoice titleForSegmentAtIndex: self.colorChoice.selectedSegmentIndex];
    sessionID = rand()%50000 + 1;
    
    imageURLString = [[NSString alloc] initWithFormat: @"http://www.floraphotographs.com/showrandomios.php?color=%@&session=%d",color,sessionID ];
    detailURLString = [NSString stringWithFormat: @"http://www.floraphotographs.com/detailios.php?session=%d",sessionID];
    
    imageURL = [[NSURL alloc] initWithString: imageURLString];
    detailURL = [NSURL URLWithString: detailURLString];
    
    [self.flowerView loadRequest: [NSURLRequest requestWithURL: imageURL]];
    [self.flowerDetailView loadRequest: [NSURLRequest requestWithURL: detailURL]];
    
    self.flowerDetailView.backgroundColor = [UIColor clearColor];
}
@end
