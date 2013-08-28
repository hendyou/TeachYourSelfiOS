//
//  EditorViewController.h
//  ModalEditor
//
//  Created by Hendy on 13-3-17.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface EditorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)dismissEditor:(id)sender;
@end
