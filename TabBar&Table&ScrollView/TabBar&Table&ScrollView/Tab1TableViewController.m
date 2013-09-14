//
//  Tab1TableViewController.m
//  TabBar&Table&ScrollView
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "Tab1TableViewController.h"
#import "HeadCellScrollView.h"
#import "ImageViewController.h"

@interface Tab1TableViewController ()

@end

@implementation Tab1TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        //init headCell
        _headCell = [[HeadCellScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        NSMutableArray *images = [NSMutableArray arrayWithCapacity:5];
        for (int i = 0; i < 5; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"sex_%d.jpg", 1 + i]];
            [images addObject:image];
        }
        [_headCell setImages:images];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headCellTap:)];
        [_headCell addGestureRecognizer:tapGesture];
        [tapGesture release];
        
        //init imageArray(图片)
        _imageArray = [[NSMutableArray arrayWithCapacity:19] retain];
        for (int i = 1 ; i <= 19; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i]];
            [_imageArray addObject:image];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)dealloc
{
    [_headCell release];
    [_imageArray release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)headCellTap:(UITapGestureRecognizer *)gesture
{
    [self toImageViewController:[_headCell currentImage]];
}

- (void)toImageViewController:(UIImage *)image
{
    ImageViewController *imageViewController = [[ImageViewController alloc] initWithImage:image];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:imageViewController animated:YES];
    [imageViewController release];
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
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//        CGRect frame = cell.imageView.frame;
//        frame.size.width = 100;
//        cell.imageView.frame = frame;
        cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [cell autorelease];
    }
    
    // Configure the cell...
    //处理第一个CELL
    if (indexPath.row == 0) {
        [cell.contentView addSubview:_headCell];
        cell.imageView.image = nil;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.text = nil;
        cell.detailTextLabel.text = nil;
    } else {
        for (UIView *view in cell.contentView.subviews) {
            [view removeFromSuperview];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [NSString stringWithFormat:@"row %d", indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d.jpg",indexPath.row];
        cell.imageView.image = _imageArray[indexPath.row - 1];
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.

    UIImage *image = nil;
    if (indexPath.row == 0) {
        image = _headCell.currentImage;
    } else {
        image = _imageArray[indexPath.row - 1];
    }
    
    [self toImageViewController:image];

    
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return _headCell.frame.size.height;
    } else {
        return 70;
    }
}

@end
