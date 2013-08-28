//
//  ViewController.m
//  FieldButtonFun
//
//  Created by Hendy Ou on 13-2-22.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
//    UIImage *normalImage = [[UIImage imageNamed: @"whiteButton.png"] stretchableImageWithLeftCapWidth: 12.0 topCapHeight: 0.0];
//    UIImage *pressedImage = [[UIImage imageNamed: @"blueButton.png"] stretchableImageWithLeftCapWidth: 12.0 topCapHeight: 0.0];
    UIEdgeInsets insets = UIEdgeInsetsMake(12.0, 12.0, 12.0, 12.0);
    UIImage *normalImage = [[UIImage imageNamed: @"whiteButton.png"] resizableImageWithCapInsets: insets resizingMode: UIImageResizingModeStretch];
    UIImage *pressedImage = [[UIImage imageNamed: @"blueButton.png"] resizableImageWithCapInsets: insets resizingMode: UIImageResizingModeStretch];
    [self.theButton setBackgroundImage: normalImage forState: UIControlStateNormal];
    [self.theButton setBackgroundImage: pressedImage forState: UIControlStateHighlighted];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createStory:(id)sender {
    NSMutableString *template = [NSMutableString stringWithString: self.theTemplate.text];
    [template replaceOccurrencesOfString: @"<place>" withString: self.thePlace.text options: NSLiteralSearch range: NSMakeRange(0, template.length)];
    [template replaceOccurrencesOfString: @"<verb>" withString: self.theVerb.text options: NSLiteralSearch range: NSMakeRange(0, template.length)];
    [template replaceOccurrencesOfString: @"<number>" withString: self.theNumber.text options: NSLiteralSearch range: NSMakeRange(0, template.length)];
    self.theStory.text = template;
}

- (IBAction)hideKeyboard:(id)sender {
    [self.thePlace resignFirstResponder];
    [self.theVerb resignFirstResponder];
    [self.theNumber resignFirstResponder];
    [self.theTemplate resignFirstResponder];
}

- (IBAction)nextInput:(id)sender {
    if ([self.thePlace isFirstResponder]) {
        [self.theVerb becomeFirstResponder];
    } else if ([self.theVerb isFirstResponder]) {
        [self.theNumber becomeFirstResponder];
    }
}
@end
