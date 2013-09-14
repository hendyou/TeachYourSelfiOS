//
//  MainViewController.m
//  PickerView
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
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
    
    //PickerView
    _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 460 - 216, 0, 0)];
    _pickView.showsSelectionIndicator = YES;
    _pickView.delegate = self;
    _pickView.dataSource = self;
    
    [self.view addSubview:_pickView];
    
    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *path = [[bundle resourcePath] stringByAppendingPathComponent:@"city.plist"];//方式1
    NSString *path = [bundle pathForResource:@"city" ofType:@"plist"];//方式2
    if (path) {
        _dataArray = [NSArray arrayWithContentsOfFile:path];
        [_dataArray retain];        
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _pickView.frame = CGRectMake(0, self.view.bounds.size.height - _pickView.bounds.size.height, _pickView.bounds.size.width, _pickView.bounds.size.height);
}

- (void)dealloc
{
    [_pickView release];
    [_dataArray release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if (component == 0) {
        return _dataArray.count;
    } else {
        int indexProvince = [pickerView selectedRowInComponent:0];
        return [[_dataArray[indexProvince] objectForKey:@"cities"] count];
    }
}

#pragma mark - Picker view delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_dataArray[row] objectForKey:@"state"];
    } else {
        int indexProvince = [pickerView selectedRowInComponent:0];
        return [[_dataArray[indexProvince] objectForKey:@"cities"] objectAtIndex:row];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    float width = 0;
    switch (component) {
        case 0:
            width = pickerView.bounds.size.width / 3 + 10;
            break;
        case 1:
            width = pickerView.bounds.size.width / 3 * 2 - 60;
            break;
        default:
            break;
    }
    return width;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}


@end
