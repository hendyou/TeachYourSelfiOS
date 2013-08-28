//
//  ViewController.m
//  PopoverEditor
//
//  Created by Hendy on 13-3-17.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIStoryboardPopoverSegue *popoverSegue = (UIStoryboardPopoverSegue *) segue;
    
    UIPopoverController *popoverController = popoverSegue.popoverController;
    popoverController.delegate = self;
    
    EditorViewController *editorVC = (EditorViewController *)popoverController.contentViewController;
    editorVC.emailField.text = self.emailLabel.text;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.emailLabel.text = ((EditorViewController *)popoverController.contentViewController).emailField.text;
}

@end
