//
//  UIButton+Create.m
//  WebSynchTools
//
//  Created by andy on 2/2/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import "UIButton+Create.h"

@implementation UIButton (Create)

+ (UIButton *)createWithFrame:(CGRect)frame
                    withTitle:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor purpleColor]];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 8.0f;
    return btn;
}
@end
