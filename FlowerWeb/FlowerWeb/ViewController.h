//
//  ViewController.h
//  FlowerWeb
//
//  Created by Hendy on 13-3-2.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (strong, nonatomic) IBOutlet UIWebView *flowerView;
@property (strong, nonatomic) IBOutlet UIWebView *flowerDetailView;
@property (strong, nonatomic) IBOutlet UIButton *flowerGetter;

- (IBAction)toggleFlowerDetail:(id)sender;
- (IBAction)getFlower:(id)sender;

@end
