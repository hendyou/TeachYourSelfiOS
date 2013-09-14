//
//  MainViewController.m
//  FontPicker
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MainViewController.h"

#define kComponentFont 0
#define kComponentSize 1

@interface MainViewController ()

- (void)updateFont:(NSString *)font size:(int)size;

@end

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
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    _pickerView.showsSelectionIndicator = YES;
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [self.view addSubview:_pickerView];
    
    //add label
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_label];
    
    //init data
    _fontArray = [[UIFont familyNames] retain];
    _sizeArray = [[NSMutableArray arrayWithCapacity:11] retain];
    int size = 10;
    for (int i = 0; i < 11; i++) {
        [_sizeArray addObject:[NSNumber numberWithInt:size]];
        size += 2;
    }
    
    //init selected size
    [_pickerView selectRow:_sizeArray.count / 2 inComponent:kComponentSize animated:NO];
}

- (void)dealloc
{
    [_fontArray release];
    [_sizeArray release];
    [_label release];
    [_pickerView release];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //init frame
    float width = self.view.bounds.size.width;
    float height = self.view.bounds.size.height;
    
    _pickerView.frame = CGRectMake(0, height - _pickerView.frame.size.height, _pickerView.frame.size.width, _pickerView.frame.size.height);
    _label.frame = CGRectMake(0, 50, width, 60);
    
    //init label
    NSString *font = _fontArray[[_pickerView selectedRowInComponent:kComponentFont]];
    NSNumber *size = _sizeArray[[_pickerView selectedRowInComponent:kComponentSize]];
    [self updateFont:font size:[size intValue]];
}

- (void)updateFont:(NSString *)font size:(int)size
{
    _label.text = font;
    _label.font = [UIFont fontWithName:font size:size];
}

#pragma mark - Picker view data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int count = 0;
    switch (component) {
        case kComponentFont:
            count = _fontArray.count;
            break;
        case kComponentSize:
            count = _sizeArray.count;
            break;
            
        default:
            break;
    }
    return count;
}

#pragma mark - Picker view data delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *str = nil;
    switch (component) {
        case kComponentFont:
            str = _fontArray[row];
            break;
        case kComponentSize:
            str = [_sizeArray[row] stringValue];
            break;
            
        default:
            break;
    }
    return str;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    float width = 0;
    switch (component) {
        case kComponentFont:
            width = 220;
            break;
        case kComponentSize:
            width = 60;
            break;
            
        default:
            break;
    }
    return width;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *font = _fontArray[[pickerView selectedRowInComponent:kComponentFont]];
    NSNumber *size = _sizeArray[[pickerView selectedRowInComponent:kComponentSize]];
    [self updateFont:font size:[size intValue]];
}

@end
