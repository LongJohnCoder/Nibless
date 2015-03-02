//
//  CustomCollectionViewCell.h
//  CustomCell
//
//  Created by Marty Burolla on 3/2/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *label;
+ (NSString*)identifier;
@end
