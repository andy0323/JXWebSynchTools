//
//  WebViewController.m
//  WebSynchTools
//
//  Created by andy on 2/2/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation WebViewController

#pragma mark -
#pragma mark 生命周期函数

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark -
#pragma mark 共有函数

- (void)reload
{
    if (_currentURL) {
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_currentURL]]];
    }
}

- (void)loadURL:(NSString *)url
{
    _currentURL = url;
    
    [self reload];
}

@end
