//
//  ViewController.m
//  GettingAttention
//
//  Created by Hendy Ou on 13-3-9.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import "ViewController.h"
#import "AttentionUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UIApplication *app = [UIApplication sharedApplication];
    app.applicationIconBadgeNumber++;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doAlert:(id)sender {
    [[AttentionUtil createOKAlertWithTitle: @"Alert Button Selected!" message: @"I need your attention NOW!" cancelButtonTitle: @"OK"] show];
}

- (IBAction)doMultiButtonAlert:(id)sender {
    [[[UIAlertView alloc] initWithTitle: @"Alert MultiButton Selected" message: @"I need your more attention NOW!!" delegate: self cancelButtonTitle: @"OK" otherButtonTitles: @"Maybe Later", @"Never", nil] show];
}

- (IBAction)doAlertInput:(id)sender {
    UIAlertView *alertDialog = [[UIAlertView alloc] initWithTitle: @"Email Address" message: @"XXXXX@icloud.com" delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: @"OK", nil];
    alertDialog.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alertDialog textFieldAtIndex:0].placeholder = @"Password";
    [alertDialog show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.title isEqualToString: @"Alert MultiButton Selected"]) {
        self.userOutput.text = [NSString stringWithFormat: @"You clicked Button %d: %@", buttonIndex, [alertView buttonTitleAtIndex: buttonIndex]];
    }
    
    if ([alertView.title isEqualToString: @"Email Address"] && alertView.firstOtherButtonIndex == buttonIndex) {
        NSString *pwd = [alertView textFieldAtIndex: 0].text;
        self.userOutput.text = [NSString stringWithFormat: @"哈哈!我知道你的密码啦!! %@", pwd];
    }
}

- (IBAction)doActionSheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil delegate: self cancelButtonTitle: @"Cancel" destructiveButtonTitle: @"Destory" otherButtonTitles: @"Negotiate", @"Compromise", @"abc", @"haha", @"shit", @"fuck", @"hello", @"love", @"go away", @"gone", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showFromRect: [(UIButton *) sender frame] inView: self.view animated: YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.userOutput.text = [NSString stringWithFormat: @"Your choice: %@", [actionSheet buttonTitleAtIndex: buttonIndex]];
}

- (IBAction)doSound:(id)sender {
    [AttentionUtil playSystemSound: @"soundeffect.wav"];
}

- (IBAction)doAlertSound:(id)sender {
    [AttentionUtil playAlertSound: @"alertsound.wav"];
}

- (IBAction)doVibration:(id)sender {
    [AttentionUtil vibrate];
}
@end
