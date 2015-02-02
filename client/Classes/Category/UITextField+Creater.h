//
//  UITextField+Creater.h
//  WebSynchTools
//
//  Created by andy on 2/1/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Creater)

+ (UITextField *)createWithFrame:(CGRect)frame
                   withTextColor:(UIColor *)textColor
                  withTextOffset:(CGFloat)offset
                 withPlaceholder:(NSString *)placeholder
                 withBorderColor:(UIColor *)borderColor;

@end
