//
//  ViewController.h
//  DateCalculator
//
//  Created by Hendy on 13-3-30.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateChooserViewController.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean dateChooserVisible;

- (IBAction)showDateChooser:(id)sender;
- (void) calculateDate:(NSDate *) date;
@end
