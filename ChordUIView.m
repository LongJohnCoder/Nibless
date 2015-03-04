//
//  ChordUIView.m
//  CustomCell
//
//  Created by Marty Burolla on 3/4/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "ChordUIView.h"

@implementation ChordUIView


-(instancetype) init
{    
    self = [super init];
    if (self!=nil) {
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(15,15,30,30);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
}

@end
