//
//  NewWeiboViewController.h
//  WiiBox
//
//  Created by Hendy Ou on 13-10-10.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "BaseViewController.h"

@interface NewWeiboViewController : BaseViewController<UITextViewDelegate>
@property (retain, nonatomic) IBOutlet UITextView *textView;

@property (retain, nonatomic) IBOutlet UIView *menuBar;
@end
