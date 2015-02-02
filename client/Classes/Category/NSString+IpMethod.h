//
//  NSString+IpMethod.h
//  JXIPControl
//
//  Created by andy on 1/30/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IpMethod)

/**
 *  获取当前设备局域网IP
 *
 *  @return 局域网IP
 */
+ (NSString *)localIPAddress;

@end
