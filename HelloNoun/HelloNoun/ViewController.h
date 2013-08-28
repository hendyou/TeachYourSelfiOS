//
//  ViewController.h
//  HelloNoun
//
//  Created by Hendy Ou on 13-2-19.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *userOutput;
@property (strong, nonatomic) IBOutlet UITextField *userInput;


- (IBAction)setOutput:(id)sender;


@end
