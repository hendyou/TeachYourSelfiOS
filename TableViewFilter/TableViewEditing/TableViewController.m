//
//  TableViewController.m
//  TableViewEditing
//
//  Created by Hendy on 13-9-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fontArray = [NSMutableArray arrayWithArray:[UIFont familyNames]];
    
    _data = [[UIFont familyNames] retain];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 6, 290, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    textField.clearsOnBeginEditing = YES;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.navigationItem.titleView = textField;
    
    [textField release];
    
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    self.navigationItem.titleView = searchBar;
//    [searchBar release];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)dealloc
{
    [_data release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _fontArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell autorelease];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 44)];
        label.font = [UIFont boldSystemFontOfSize:20];
        label.tag = 100;
        [cell.contentView addSubview:label];
        [label release];
    }
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:100];
    label.text = _fontArray[indexPath.row];
//    cell.textLabel.text = _fontArray[indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (void) textChange:(UITextField *)textField
{
    if ([textField.text length] == 0) {
        self.fontArray = _data;
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"SELF CONTAINS[cd]'%@'", textField.text]];
        self.fontArray = [_data filteredArrayUsingPredicate:predicate];
    }
    [self.tableView reloadData];

}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
