//
//  UITextField+Creater.m
//  WebSynchTools
//
//  Created by andy on 2/1/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import "UITextField+Creater.h"

@implementation UITextField (Creater)

+ (UITextField *)createWithFrame:(CGRect)frame
                   withTextColor:(UIColor *)textColor
                  withTextOffset:(CGFloat)offset
                 withPlaceholder:(NSString *)placeholder
                 withBorderColor:(UIColor *)borderColor
{
    UITextField *tf = [[UITextField alloc] initWithFrame:frame];
    tf.textColor = textColor;
    tf.placeholder = placeholder;
    tf.borderStyle = UITextBorderStyleNone;
    tf.backgroundColor = [UIColor whiteColor];
    tf.layer.masksToBounds = YES;
    tf.layer.borderWidth = 0.5;
    tf.layer.borderColor = borderColor.CGColor;
    tf.layer.cornerRadius = 8.0f;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, offset, tf.frame.size.height)];
    tf.leftView = leftView;
    tf.leftViewMode = UITextFieldViewModeAlways;
    return tf;
}
@end
