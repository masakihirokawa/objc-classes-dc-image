DCImage
=====================

「イメージビューの生成」や「全画面画像の取得」、「マスク適用」に「リサイズ処理」など4種類の機能を実装する「DCImage」クラスです。

##主な機能

1. イメージビューの取得
2. 全画面画像の取得 (デバイス判別機能を使用)
3. 画像にマスク適用
4. 画像のリサイズ

##使用方法

###画像(UIImageView) の取得

```objective-c
//画像を取得
UIImageView *imageView = [DCImage imageView:@"Pandora_640_1136"
                                   imageExt:@"jpg"
                                       rect:CGRectMake(0, 0, IMG_WIDTH_iPhone5, IMG_HEIGHT_iPhone5)];
```

###全画面背景画像の取得

```objective-c
//クラス初期化
DCImage *dcImage = [[DCImage alloc] init];

//全画面の背景画像を取得
UIImageView *imageView = [DCImage imageView:[dcImage backgroundImageName:@"Pandora"]
                                   imageExt:@"jpg"
                                       rect:CGRectMake(0, 0, IMG_WIDTH_iPhone5, IMG_HEIGHT_iPhone5)];
```

###画像にマスク適用

```objective-c
//マスクを適用する画像
UIImage *image = [DCImage getUIImageFromResources:@"Pandora_640_1136" ext:@"jpg"];

//マスク画像
UIImage *imageMask = [DCImage getUIImageFromResources:@"image_mask" ext:@"png"];

//マスク適用
UIImage *maskedImage = [DCImage mask:image withMask:imageMask];
```

###画像のリサイズ

```objective-c
//画像取得
UIImage *image = [DCImage getUIImageFromResources:@"Pandora_640_1136" ext:@"jpg"];

//画像リサイズ適用
image = [DCImage resize:image rect:CGRectMake(0, 0, 160, 283)];
```

##サンプルソースコード

###ViewController.h

```objective-c
#import <UIKit/UIKit.h>
#import "DCImage.h"

//サンプルの処理振り分け (1〜4)
#define MODE               1

#define IMG_WIDTH_iPhone5  320
#define IMG_HEIGHT_iPhone5 568

@interface ViewController : UIViewController

@end
```

###ViewController.m

```objective-c
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

typedef enum sample : NSInteger {
    MODE_IMAGE_VIEW = 1,
    MODE_BG_IMAGE = 2,
    MODE_MASK_IMAGE = 3,
    MODE_RESIZE_IMAGE = 4
} sample;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    switch (MODE) {
        case MODE_IMAGE_VIEW:
            //イメージを表示
            [self setImageView];
            break;
        case MODE_BG_IMAGE:
            //全画面の背景画像を表示
            [self setBackgroundImage];
            break;
        case MODE_MASK_IMAGE:
            //画像にマスクを適用
            [self setImageMask];
            break;
        case MODE_RESIZE_IMAGE:
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
                                           rect:CGRectMake(0, 0, IMG_WIDTH_iPhone5, IMG_HEIGHT_iPhone5)];
    
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
                                           rect:CGRectMake(0, 0, IMG_WIDTH_iPhone5, IMG_HEIGHT_iPhone5)];
    
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
    imageView.frame = CGRectMake(0, 0, IMG_WIDTH_iPhone5, IMG_HEIGHT_iPhone5);
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
    imageView.frame = CGRectMake(0, 0, IMG_WIDTH_iPhone5, IMG_HEIGHT_iPhone5);
    imageView.image = image;
    [self.view addSubview:imageView];
}

@end
```