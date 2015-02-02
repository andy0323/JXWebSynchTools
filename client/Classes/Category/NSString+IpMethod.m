//
//  NSString+IpMethod.m
//  JXIPControl
//
//  Created by andy on 1/30/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import "NSString+IpMethod.h"
#include <arpa/inet.h>
#include <net/if.h>
#include <ifaddrs.h>

@implementation NSString (IpMethod)

+ (NSString *)localIPAddress
{
    NSString *localIP = nil;
    struct ifaddrs *addrs;
    if (getifaddrs(&addrs)==0) {
        const struct ifaddrs *cursor = addrs;
        while (cursor != NULL) {
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                //NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                //if ([name isEqualToString:@"en0"]) // Wi-Fi adapter
                {
                    localIP = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
                    break;
                }
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return localIP;
}
@end
