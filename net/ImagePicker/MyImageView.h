//
//  MyImageView.h
//  net
//
//  Created by Hendy on 13-9-7.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyImageView : UIImageView <NSURLConnectionDataDelegate>
{
    @private
    NSMutableData *_data;
}
- (void)setImageFromUrl:(NSURL *)url;
@end
