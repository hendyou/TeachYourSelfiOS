//
//  MainViewController.m
//  Hour5Practice1
//
//  Created by Hendy Ou on 13-2-19.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.textView.text = @"Ladies And Gentlemen, I am so glad to lead this show tonight, now, please let me show you the super belle for today is.......... DENG DENG DENG DENG!! DENG DENG DENG DENG!!! @#$% 18禁禁禁 @#$%";
    
    self.slider.maximumValue = 100.0;
    self.slider.value = 80;
    
    self.textView.delegate = self;
    
    self.textField.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // 键盘高度变化通知，ios5.0新增的
#ifdef __IPHONE_5_0
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 5.0) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)chosedFromSegmentedControl:(id)sender
{
    NSString *title = [self.segmentedControl titleForSegmentAtIndex: self.segmentedControl.selectedSegmentIndex];
    self.label.text = [NSString stringWithFormat: @"Your choice from segmentedControl is: %@", title ];
}

- (void)clickedFromButton:(id)sender
{
    self.label.text = @"Button onClicked";
}

- (void)sliding:(id)sender
{
    self.label.text = [NSString stringWithFormat: @"Slider max: %.1f%% min: %.0f%% current: %.2f%%", self.slider.maximumValue, self.slider.minimumValue, self.slider.value];
}

- (void)switched:(id)sender
{
    self.label.text = [NSString stringWithFormat: @"Switch State: %@", self._switch.on ? @"ON" : @"OFF"];
}

- (void)step:(id)sender
{
    self.label.text = [NSString stringWithFormat: @"Stepper max: %.0fstep min: %.0fstep current: %.0fstep", self.stepper.maximumValue, self.stepper.minimumValue, self.stepper.value];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return [self resignFirstResponder: self.textView withText: text];
}

- (BOOL) resignFirstResponder: (UIResponder *) responder withText: (NSString *) text
{
    if ([text isEqualToString: @"\n"]) {
        [responder resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return [self resignFirstResponder: self.textField withText: string];
}

//开始编辑输入框的时候,软键盘出现,招待此事件
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = self.textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0); // 键盘高度 216
    
    NSTimeInterval animationDuration = 0.3f;
    [UIView beginAnimations: @"ResizeForKeyboard" context: nil];
    [UIView setAnimationDuration: animationDuration];
    
    //将视力的Y坐标向上移动offset个单位,以使下面腾出地方用于软键盘的显示
    if (offset > 0) {
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    }
    
    [UIView commitAnimations];
}

//输入框编辑完成以后,将视力恢复到原始状态
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    NSTimeInterval animationDuration = 0.3f;
    [UIView beginAnimations: @"ResizeForKeyboard" context: nil];
    [UIView setAnimationDuration: animationDuration];
    self.view.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    
    [UIView commitAnimations];
}

#pragma mark -
#pragma mark Responding to keyboard events
- (void)keyboardWillShow:(NSNotification *)notification {
    
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     Animate the resize so that it's in sync with the appearance of the keyboard.
     */
    
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the origin of the keyboard when it's displayed.
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
    CGRect keyboardRect = [aValue CGRectValue];
    
    // Get the duration of the animation.
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    // Animate the resize of the text view's frame in sync with the keyboard's appearance.
//    [self moveInputBarWithKeyboardHeight:keyboardRect.size.height withDuration:animationDuration];
    NSLog(@"keyboard show");
}


- (void)keyboardWillHide:(NSNotification *)notification {
    
    NSDictionary* userInfo = [notification userInfo];
    
    /*
     Restore the size of the text view (fill self's view).
     Animate the resize so that it's in sync with the disappearance of the keyboard.
     */
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
//    [self moveInputBarWithKeyboardHeight:0.0 withDuration:animationDuration];
    NSLog(@"keyboard hide");
}

@end
