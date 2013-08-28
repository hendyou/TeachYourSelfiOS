//
//  ViewController.h
//  PopoverEditor
//
//  Created by Hendy on 13-3-17.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditorViewController.h"

@interface ViewController : UIViewController <UIPopoverControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;

@end
