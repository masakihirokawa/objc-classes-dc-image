//
//  ViewController.m
//  DCImageSample
//
//  Created by 廣川政樹 on 2013/06/17.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    switch (MODE) {
        case 1:
            //イメージを表示
            [self setImageView];
            break;
        case 2:
            //全画面の背景画像を表示
            [self setBackgroundImage];
            break;
        case 3:
            //画像にマスクを適用
            [self setImageMask];
            break;
        case 4:
            //画像のリサイズ適用
            [self resizeImage];
            break;
    }
}

//イメージを表示
- (void)setImageView
{
    //画像を取得
    UIImageView *imageView = [DCImage imageView:@"Pandora_640_1136"
                                       imageExt:@"jpg"
                                           rect:CGRectMake(0, 0, IMG_WIDTH_IPHONE5, IMG_HEIGHT_IPHONE5)];
    
    //画面に追加
    [self.view addSubview:imageView];
}

//全画面の背景画像を表示
- (void)setBackgroundImage
{
    //クラス初期化
    DCImage *dcImage = [[DCImage alloc] init];
    
    //全画面の背景画像を取得
    UIImageView *imageView = [DCImage imageView:[dcImage backgroundImageName:@"Pandora"]
                                       imageExt:@"jpg"
                                           rect:CGRectMake(0, 0, IMG_WIDTH_IPHONE5, IMG_HEIGHT_IPHONE5)];
    
    //画面に追加
    [self.view addSubview:imageView];
}

//画像にマスクを適用
- (void)setImageMask
{
    //マスクを適用する画像
    UIImage *image = [DCImage getUIImageFromResources:@"Pandora_640_1136" ext:@"jpg"];
    
    //マスク画像
    UIImage *imageMask = [DCImage getUIImageFromResources:@"image_mask" ext:@"png"];
    
    //マスク適用
    UIImage *maskedImage = [DCImage mask:image withMask:imageMask];
    
    //画面に追加
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, IMG_WIDTH_IPHONE5, IMG_HEIGHT_IPHONE5);
    imageView.image = maskedImage;
    [self.view addSubview:imageView];
}

//画像のリサイズ適用
- (void)resizeImage
{
    //画像取得
    UIImage *image = [DCImage getUIImageFromResources:@"Pandora_640_1136" ext:@"jpg"];
    
    //画像リサイズ適用
    image = [DCImage resize:image rect:CGRectMake(0, 0, 160, 283)];
    
    //画面に追加
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, IMG_WIDTH_IPHONE5, IMG_HEIGHT_IPHONE5);
    imageView.image = image;
    [self.view addSubview:imageView];
}

@end
