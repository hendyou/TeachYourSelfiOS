//
//  ViewController.h
//  GettingAttention
//
//  Created by Hendy Ou on 13-3-9.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UILabel *userOutput;

- (IBAction)doAlert:(id)sender;
- (IBAction)doMultiButtonAlert:(id)sender;
- (IBAction)doAlertInput:(id)sender;
- (IBAction)doActionSheet:(id)sender;
- (IBAction)doSound:(id)sender;
- (IBAction)doAlertSound:(id)sender;
- (IBAction)doVibration:(id)sender;

@end
