//
//  UIColor+MyColors.m
//  CustomCell
//
//  Created by Marty Burolla on 2/27/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "UIColor+MyColors.h"

@implementation UIColor (MyColors)

+ (UIColor*)lighterGray
{
    return [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1];
}

+ (UIColor*)lightBlue
{
     return [UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:255.0/255.0 alpha:1];
}

+ (UIColor*)lightRed
{
    return [UIColor colorWithRed:255.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1];
}

+ (UIColor*)lightBrown
{
    return [UIColor colorWithRed:181.0/255.0 green:150.0/255.0 blue:148.0/255.0 alpha:1];
}

+ (UIColor*)lightYellow
{
     return [UIColor colorWithRed:248.0/255.0 green:255.0/255.0 blue:168.0/255.0 alpha:1];
}


@end
