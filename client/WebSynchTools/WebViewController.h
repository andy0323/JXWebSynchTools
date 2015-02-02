//
//  WebViewController.h
//  WebSynchTools
//
//  Created by andy on 2/2/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
{
    NSString *_currentURL;
}

- (void)reload;
- (void)loadURL:(NSString *)url;
@end
