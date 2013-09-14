//
//  ModalViewController.m
//  HMGLTransitionsTest
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ModalViewController.h"
#import "FlipTransition.h"
#import "HMGLTransitionManager.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(UIButton *)sender {
    FlipTransition *flip = [[[FlipTransition alloc] init] autorelease];
    flip.transitionType = FlipTransitionRight;
    [[HMGLTransitionManager sharedTransitionManager] setTransition:flip];
    [[HMGLTransitionManager sharedTransitionManager] dismissModalViewController:self];
}
@end
