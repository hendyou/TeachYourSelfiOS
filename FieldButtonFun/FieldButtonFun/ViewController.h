//
//  ViewController.h
//  FieldButtonFun
//
//  Created by Hendy Ou on 13-2-22.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *thePlace;
@property (strong, nonatomic) IBOutlet UITextField *theVerb;
@property (strong, nonatomic) IBOutlet UITextField *theNumber;
@property (strong, nonatomic) IBOutlet UITextView *theTemplate;
@property (strong, nonatomic) IBOutlet UITextView *theStory;
@property (strong, nonatomic) IBOutlet UIButton *theButton;

- (IBAction)createStory:(id)sender;
- (IBAction)hideKeyboard:(id)sender;
- (IBAction)nextInput:(id)sender;

@end
