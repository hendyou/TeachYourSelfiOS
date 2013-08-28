//
//  EditorViewController.m
//  ModalEditor
//
//  Created by Hendy on 13-3-17.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

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
    self.emailField.text = ((ViewController *) self.presentingViewController).emailLabel.text;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissEditor:(id)sender {
    ((ViewController *) self.presentingViewController).emailLabel.text = self.emailField.text;
    
    [self dismissViewControllerAnimated: YES completion: nil];
}
@end
