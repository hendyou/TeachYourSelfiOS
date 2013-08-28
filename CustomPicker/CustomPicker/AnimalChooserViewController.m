//
//  AnimalChooserViewController.m
//  CustomPicker
//
//  Created by Hendy Ou on 13-4-3
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import "AnimalChooserViewController.h"
#import "ViewController.h"

#define kComponentCount 2
#define kAnimalComponent 0
#define kSoundComponent 1
#define kNoComponent -1
#define kNothing @"nothing yet..."

@interface AnimalChooserViewController ()

@end

@implementation AnimalChooserViewController

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
    self.animalNames = [NSArray arrayWithObjects:@"Bear", @"Cat", @"Dog", @"Goose", @"Mouse", @"Pig", @"Snake", nil];
    self.animalSounds = [NSArray arrayWithObjects:@"Honk~", @"Miao~", @"WoWo~", @"Rawr~", @"JiJi~", @"Squeak~", @"Ssss~", nil];
    
    self.animalImages = [NSArray arrayWithObjects:
                         [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"bear.png"]],
                         [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"cat.png"]],
                         [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"dog.png"]],
                         [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"goose.png"]],
                         [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"mouse.png"]],
                         [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"pig.png"]],
                         [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"snake.png"]],
                         nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self displayInInitalView: kNoComponent];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self dismissAnimalChooser];
    
    self.delegate = nil;
    self.animalImages = nil;
    self.animalNames = nil;
    self.animalSounds = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)dismissAnimalChooser
{
    self.delegate.animalChooserVisible = NO;
}

- (IBAction)dismiss:(id)sender {
    [self.popover dismissPopoverAnimated:YES];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return kComponentCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch(component) {
        case kAnimalComponent:
            return [self.animalNames count];
            break;
        case kSoundComponent:
            return [self.animalSounds count];
            break;
        
        default:
            return 0;
            break;
    }
}

#pragma mark - UIPickerViewDelegate
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component == kAnimalComponent) {
        return [self.animalImages objectAtIndex: row];
    } else {
        UILabel *soundLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 100, 32)];
        soundLabel.backgroundColor = [UIColor clearColor];
        soundLabel.text = [self.animalSounds objectAtIndex: row];
        return soundLabel;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    if (component == kAnimalComponent) {
        return 60;
    }
    return 40;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == kAnimalComponent) {
        return 125;
    } else {
        return pickerView.frame.size.width - 125 - 100;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self displayInInitalView: component];
}

- (void)displayInInitalView:(int)component
{
    ViewController *initalView = (ViewController *) self.delegate;
    
    NSString *chosenComponent = nil;
    if (component == kAnimalComponent) {
        chosenComponent = @"Animal";
    } else if (component == kSoundComponent){
        chosenComponent = @"Sound";
    } else {
        chosenComponent = kNothing;
    }
    int rowAnimal= [self.animalPicker selectedRowInComponent: kAnimalComponent];
    int rowSound = [self.animalPicker selectedRowInComponent: kSoundComponent];
    [initalView displayAnimal: [self.animalNames objectAtIndex: rowAnimal] withSound:[self.animalSounds objectAtIndex: rowSound] fromComponent: chosenComponent];
    
    initalView.rowAnimal = rowAnimal;
    initalView.rowSound = rowSound;
}

@end
