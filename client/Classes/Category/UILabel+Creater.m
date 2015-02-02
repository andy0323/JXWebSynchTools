//
//  UILabel+Creater.m
//  WebSynchTools
//
//  Created by andy on 2/1/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import "UILabel+Creater.h"

@implementation UILabel (Creater)

+ (UILabel *)createWithFrame:(CGRect)frame withText:(NSString *)text withTextColor:(UIColor *)textColor
{
    UILabel *lb = [[UILabel alloc] initWithFrame:frame];
    lb.text = text;
    lb.textColor = textColor;
    lb.backgroundColor = [UIColor clearColor];
    [lb sizeToFit];
    return lb;
}
@end
