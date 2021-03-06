//
//  UILabel+Creater.h
//  WebSynchTools
//
//  Created by andy on 2/1/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Creater)

+ (UILabel *)createWithFrame:(CGRect)frame
                    withText:(NSString *)text
               withTextColor:(UIColor *)textColor;

@end
