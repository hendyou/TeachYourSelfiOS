//
//  AnimalChooserViewController.h
//  CustomPicker
//
//  Created by Hendy Ou on 13-4-3.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface AnimalChooserViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) ViewController *delegate;
@property (strong, nonatomic) UIPopoverController *popover;
@property (strong, nonatomic) NSArray *animalNames;
@property (strong, nonatomic) NSArray *animalSounds;
@property (strong, nonatomic) NSArray *animalImages;
@property (strong, nonatomic) IBOutlet UIPickerView *animalPicker;

- (void) dismissAnimalChooser;
- (IBAction)dismiss:(id)sender;
- (void) displayInInitalView: (int) component;

@end
