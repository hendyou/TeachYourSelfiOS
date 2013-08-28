//
//  DateChooserViewController.h
//  DateCalculator
//
//  Created by Hendy on 13-3-30.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DateChooserViewController : UIViewController

@property (strong, nonatomic) id delegate;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)dismissDateChooser:(id)sender;
- (IBAction)setDateTime:(id)sender;
@end
