//
//  MainViewController.m
//  ImagePicker
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MainViewController.h"
#import "UIImageView+WebCach.h"

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
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 350)];
    _imageView.backgroundColor = [UIColor cyanColor];
    _imageView.clipsToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_imageView];
    
    //加载网络图片
    NSURL *url = [NSURL URLWithString:@"http://h.hiphotos.baidu.com/album/w%3D2048/sign=979e129794cad1c8d0bbfb274b066609/5366d0160924ab1830fbe38f34fae6cd7a890b9c.jpg"];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:data];

    //多线程方式加载
    [_imageView setImageWithUrl:url];
    
    //保存到相册里
//    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    //访问系统相册
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.tag = 100;
    button.frame = CGRectMake(30, 400, 100, 30);
    [button setTitle:@"访问相册" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(toImagePicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //访问系统相册
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.tag = 101;
    button2.frame = CGRectMake(190, 400, 100, 30);
    [button2 setTitle:@"访问相机" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(toImagePicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)toImagePicker:(UIButton *)sender
{
    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
        NSLog(@"UIImagePickerControllerCameraDeviceRear is available");
    } else if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
        NSLog(@"UIImagePickerControllerCameraDeviceFront is available");
    } else {
        NSLog(@"UIImagePickerControllerCameraDevice is unavailable");
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if (sender.tag == 100) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //只访问相机的相片
//        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    } else {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        } else {
            NSLog(@"UIImagePickerControllerSourceTypeCamera is unavailable");
            [imagePicker release];
            return;
        }
    }
    //访问所有相簿
    imagePicker.delegate = self;
    //允许编辑图片(拍照后可以编辑图片)
    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    [imagePicker release];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"%@", error);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_imageView release];
    [super dealloc];
}

#pragma mark - UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //取原图片
//    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    //取编辑后的图片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    _imageView.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
