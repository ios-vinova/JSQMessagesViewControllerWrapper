//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "UIImage+JSQMessages.h"

#import "NSBundle+JSQMessages.h"


@implementation UIImage (JSQMessages)

- (UIImage *)jsq_imageMaskedWithColor:(UIColor *)maskColor
{
    NSParameterAssert(maskColor != nil);
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextScaleCTM(context, 1.0f, -1.0f);
        CGContextTranslateCTM(context, 0.0f, -(imageRect.size.height));
        
        CGContextClipToMask(context, imageRect, self.CGImage);
        CGContextSetFillColorWithColor(context, maskColor.CGColor);
        CGContextFillRect(context, imageRect);
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)jsq_bubbleImageFromBundleWithName:(NSString *)name
{
    NSBundle *bundle = [NSBundle jsq_messagesAssetBundle];
    NSString *path = [bundle pathForResource:name ofType:@"png" inDirectory:@"Images"];
    return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *)jsq_bubbleRegularImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_regular"];
}

+ (UIImage *)jsq_bubbleRegularTaillessImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_tailless"];
}

+ (UIImage *)jsq_bubbleRegularStrokedImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_stroked"];
}

+ (UIImage *)jsq_bubbleRegularStrokedTaillessImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_stroked_tailless"];
}

+ (UIImage *)jsq_bubbleCompactImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_min"];
}

+ (UIImage *)jsq_bubbleDefault
{
    UIImage *newImage   = nil;
    CGRect  imageRect   = CGRectMake(0, 0, 200, 50);
    CGFloat scale       = 0;

    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    const CGFloat radius = 10;
    const CGFloat lineWidth = 10;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(imageRect, lineWidth / 2, lineWidth / 2)
                                                    cornerRadius:radius];
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    path.lineWidth = lineWidth;
    [path stroke];
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    [path fill];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)jsq_bubbleCompactTaillessImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_min_tailless"];
}

+ (UIImage *)jsq_defaultAccessoryImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"clip"];
}

+ (UIImage *)jsq_defaultTypingIndicatorImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"typing"];
}

+ (UIImage *)jsq_defaultPlayImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"play"];
}

+ (UIImage *)jsq_defaultPauseImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"pause"];
}

@end
