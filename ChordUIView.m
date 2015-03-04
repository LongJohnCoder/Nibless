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
    [self drawStrings];
    [self drawFrets];
    [self drawNotes];
}

-(void)drawStrings
{
    CGPoint p1 = { 10, 10 };
    CGPoint p2 = { 10, 50 };
    
    for (int i=0; i< 6; i++)
    {
        [self drawLineStartPoint: p1 endPoint: p2];
        p1.x += 8;
        p2.x += 8;
    }
}

-(void)drawFrets
{
    CGPoint p1 = { 10, 10 };
    CGPoint p2 = { 50, 10 };
    
    for (int i=0; i< 6; i++)
    {
        [self drawLineStartPoint: p1 endPoint: p2];
        p1.y += 8;
        p2.y += 8;
    }
}

-(void)drawNotes
{
    CGRect borderRect = CGRectMake(8.0, 8.0, 5, 5);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextFillEllipseInRect (context, borderRect);
    CGContextFillPath(context);
    
    borderRect = CGRectMake(8.0, 16.0, 5, 5);
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextFillEllipseInRect (context, borderRect);
    CGContextFillPath(context);
    
    borderRect = CGRectMake(8.0, 24.0, 5, 5);
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextFillEllipseInRect (context, borderRect);
    CGContextFillPath(context);
}

-(void)drawLineStartPoint:(CGPoint) beginning endPoint:(CGPoint) end
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, beginning.x, beginning.y);
    CGContextAddLineToPoint(context, end.x, end.y);
    
    CGContextStrokePath(context);
}


@end

/*
CGRect borderRect = CGRectMake(0.0, 0.0, 60.0, 60.0);
CGContextRef context = UIGraphicsGetCurrentContext();
CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
CGContextSetRGBFillColor(context, colorRed, colorGreen, colorBlue, 1.0);
CGContextSetLineWidth(context, 2.0);
CGContextFillEllipseInRect (context, borderRect);
CGContextStrokeEllipseInRect(context, borderRect);
CGContextFillPath(context);
*/

/*
 // Red square
 UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGRect strokeRect = CGRectMake(0,0,55,55);
 CGContextSetStrokeColorWithColor(context, redColor.CGColor);
 CGContextSetLineWidth(context, 1.0);
 CGContextStrokeRect(context, strokeRect);
*/


/*
 // Circle
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSetLineWidth(context, 5.0);
 CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
 CGRect rectangle = CGRectMake(15,15,30,30);
 CGContextAddEllipseInRect(context, rectangle);
 CGContextStrokePath(context);
 */