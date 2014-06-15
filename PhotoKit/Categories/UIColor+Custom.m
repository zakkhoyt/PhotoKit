//
//  UIColors+Custom.m
//  Imgur
//
//  Created by Zakk Hoyt on 4/24/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "UIColor+Custom.h"

@implementation UIColor (Custom)

+(UIColor*)randomColor{
    CGFloat red = (arc4random() % 0xFF) / (float)0xFF;
    CGFloat blue = (arc4random() % 0xFF) / (float)0xFF;
    CGFloat green = (arc4random() % 0xFF) / (float)0xFF;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}


+(UIColor*)randomColorWithAlpha:(float)alpha{
    CGFloat red = (arc4random() % 0xFF) / (float)0xFF;
    CGFloat blue = (arc4random() % 0xFF) / (float)0xFF;
    CGFloat green = (arc4random() % 0xFF) / (float)0xFF;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
