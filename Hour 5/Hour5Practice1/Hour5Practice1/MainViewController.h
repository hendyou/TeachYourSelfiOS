//
//  MainViewController.h
//  Hour5Practice1
//
//  Created by Hendy Ou on 13-2-19.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *_switch;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction) chosedFromSegmentedControl:(id)sender;
- (IBAction) clickedFromButton:(id)sender;
- (IBAction) sliding:(id)sender;
- (IBAction) switched:(id)sender;
- (IBAction) step:(id)sender;


@end
