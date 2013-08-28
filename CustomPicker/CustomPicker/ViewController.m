//
//  ViewController.m
//  CustomPicker
//
//  Created by Hendy Ou on 13-4-3.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
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

- (IBAction)showAnimalChooser:(id)sender {
    if (self.animalChooserVisible != YES) {
        [self performSegueWithIdentifier: @"toAnimalChooser" sender: sender];
        self.animalChooserVisible = YES;
    } else {
        [self.popover dismissPopoverAnimated:YES];
        self.popover = nil;
    }
}

- (void)displayAnimal:(NSString *)animal withSound:(NSString *)sound fromComponent:(NSString *)component
{
    NSString *animalSoundString = [NSString stringWithFormat:@"You changed %@ (%@ say: %@)", component, animal, sound];
    self.outputLabel.text = animalSoundString;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.popover = ((UIStoryboardPopoverSegue *) segue).popoverController;
    AnimalChooserViewController *animalChooser = (AnimalChooserViewController *) segue.destinationViewController;
    animalChooser.delegate = self;
    animalChooser.popover = self.popover;
    
    [animalChooser.animalPicker selectRow: self.rowAnimal inComponent: 0 animated:NO];
    [animalChooser.animalPicker selectRow: self.rowSound inComponent: 1 animated: NO];
}
@end
