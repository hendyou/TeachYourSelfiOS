//
//  MainViewController.m
//  HMGLTransitionsTest
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MainViewController.h"
#import "ModalViewController.h"
#import "Switch3DTransition.h"
#import "FlipTransition.h"
#import "HMGLTransitionManager.h"

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)transitionAction:(UIButton *)sender {
    Switch3DTransition *switch3D = [[[Switch3DTransition alloc] init] autorelease];
    
    [[HMGLTransitionManager sharedTransitionManager] setTransition:switch3D];
    [[HMGLTransitionManager sharedTransitionManager] beginTransition:self.myView];
    [self.myView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [[HMGLTransitionManager sharedTransitionManager] commitTransition];
}

- (IBAction)modalAction:(UIButton *)sender {
    FlipTransition *flip = [[[FlipTransition alloc] init] autorelease];
    flip.transitionType = FlipTransitionLeft;
    [[HMGLTransitionManager sharedTransitionManager] setTransition:flip];
    
    ModalViewController *viewCtrl = [[[ModalViewController alloc] init] autorelease];
    [[HMGLTransitionManager sharedTransitionManager] presentModalViewController:viewCtrl onViewController:self];
}

- (void)dealloc {
    [_myView release];
    [super dealloc];
}
@end
