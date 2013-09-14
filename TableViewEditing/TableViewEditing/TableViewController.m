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
    
    _fontArray = [[NSMutableArray arrayWithArray:[UIFont familyNames]] retain];
    
    //添加编辑按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //允许编辑时多选
//    self.tableView.allowsMultipleSelectionDuringEditing = YES;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    if (!editing) {
        [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    }
}

- (void)delete
{
    NSArray *indexPathArray = self.tableView.indexPathsForSelectedRows;
    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];
    for (NSIndexPath *path in indexPathArray) {
        [indexSet addIndex:path.row];
    }
    [_fontArray removeObjectsAtIndexes:indexSet];
    [self.tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [indexSet release];
 
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if (indexPath.row == 0) {
        return NO;
    }
    return YES;
}

static int count = 1;
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_fontArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        NSString *newFontStr = [NSString stringWithFormat:@"%@ (%d)", _fontArray[indexPath.row], count++];
        [_fontArray insertObject:newFontStr atIndex:indexPath.row + 1];
//        NSString *newFontStr2 = [NSString stringWithFormat:@"%@ (%d)", _fontArray[indexPath.row], count++];
//        [_fontArray insertObject:newFontStr2 atIndex:indexPath.row + 2];
        
        NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
//        NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:indexPath.row + 2 inSection:indexPath.section];
        
        [self.tableView insertRowsAtIndexPaths:@[indexPath1] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    NSLog(@"commit editing");
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *font1 = [[_fontArray objectAtIndex:fromIndexPath.row] copy];
    NSString *font2 = [_fontArray objectAtIndex:toIndexPath.row];
    [_fontArray replaceObjectAtIndex:fromIndexPath.row withObject:font2];
    [_fontArray replaceObjectAtIndex:toIndexPath.row withObject:font1];
    [font1 release];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2) {
        return NO;
    }
    return YES;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    if (self.editing) {
        NSArray *indexPathArray = self.tableView.indexPathsForSelectedRows;
        if (indexPathArray.count > 0 && self.navigationItem.leftBarButtonItem == nil) {
            //        UIBarButtonItem *deleteBtn = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleBordered target:self action:@selector(delete)];
            UIBarButtonItem *deleteBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(delete)];
            [self.navigationItem setLeftBarButtonItem:deleteBtn animated:YES];            
        }
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.editing) {
        NSArray *indexPathArray = self.tableView.indexPathsForSelectedRows;
        if (indexPathArray.count == 0 && self.navigationItem.leftBarButtonItem != nil) {
            [self.navigationItem setLeftBarButtonItem:nil animated:YES];
        }
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        return UITableViewCellEditingStyleNone;
    } else if (indexPath.row == 2) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

- (void)dealloc
{
    [_fontArray release];
    [super dealloc];
}


@end
