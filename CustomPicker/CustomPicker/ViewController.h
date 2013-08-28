//
//  ViewController.h
//  CustomPicker
//
//  Created by Hendy Ou on 13-4-3.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) UIPopoverController *popover;

@property (nonatomic) Boolean animalChooserVisible;
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;

@property (nonatomic) int rowAnimal;
@property (nonatomic) int rowSound;

- (IBAction)showAnimalChooser:(id)sender;

- (void) displayAnimal:(NSString *) animal
             withSound:(NSString *) sound
         fromComponent:(NSString *) component;

@end
