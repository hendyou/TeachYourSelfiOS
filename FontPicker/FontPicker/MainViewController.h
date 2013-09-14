//
//  MainViewController.h
//  FontPicker
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSArray *_fontArray;
    NSMutableArray *_sizeArray;
    
    UILabel *_label;
    UIPickerView *_pickerView;
}

@end
