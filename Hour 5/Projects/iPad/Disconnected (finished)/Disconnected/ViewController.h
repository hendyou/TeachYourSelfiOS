//
//  ViewController.h
//  Disconnected
//
//  Created by John E. Ray on 9/8/12.
//  Copyright (c) 2012 John E. Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (weak, nonatomic) IBOutlet UIWebView *flowerView;
@property (weak, nonatomic) IBOutlet UILabel *chosenColor;

- (IBAction)getFlower:(id)sender;

@end
