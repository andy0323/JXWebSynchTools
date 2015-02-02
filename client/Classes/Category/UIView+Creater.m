//
//  UIView+Creater_.m
//  WebSynchTools
//
//  Created by andy on 2/1/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import "UIView+Creater.h"

@implementation UIView (Creater)

+ (UIView *)createCirCleWithFrame:(CGRect)frame
                    withBgColor:(UIColor *)bgColor
{
    if (frame.size.width != frame.size.height) {
        NSLog(@"长宽不一致、请重新输入");
        return nil;
    }
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.backgroundColor = bgColor;
    v.layer.masksToBounds = YES;
    v.layer.cornerRadius = frame.size.width/2;
    
    return v;
}

@end
