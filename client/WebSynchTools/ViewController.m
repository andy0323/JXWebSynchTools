//
//  ViewController.m
//  WebSynchTools
//
//  Created by andy on 2/1/15.
//  Copyright (c) 2015 Andy Jin. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+Creater.h"
#import "UILabel+Creater.h"
#import "UIView+Creater.h"
#import "UIButton+Create.h"
#import "NSString+IpMethod.h"

#import "SRWebSocket.h"
#import "Reachability.h"
#import "WebViewController.h"

#define DEFAULT_PORT @"45678"

@interface ViewController ()<SRWebSocketDelegate>
{
    // 输入框
    UITextField *_ipTextField;
    UITextField *_portTextField;
    
    // WIFI 状态
    UILabel *_wifiLabel;
    UIView *_wifiLight;

    // 开始连接
    UIButton *_startBtn;

    SRWebSocket *_socket;
    Reachability *_reach;
    
    WebViewController *_webVC;
}
@end

@implementation ViewController

- (void)createUI
{
    float DEVICE_WIDTH = [UIScreen mainScreen].bounds.size.width;
    
    float TF_WIDTH = 250;
    
    CGRect tfRect = CGRectMake((DEVICE_WIDTH-TF_WIDTH)/2, 100, TF_WIDTH, 40);
    
    _ipTextField = [UITextField createWithFrame:tfRect
                                  withTextColor:[UIColor blackColor]
                                 withTextOffset:30.0f
                                withPlaceholder:@"请输入IP地址"
                                withBorderColor:[UIColor lightGrayColor]];
                    

    tfRect.origin.y += 60;
    _portTextField = [UITextField createWithFrame:tfRect
                                    withTextColor:[UIColor darkGrayColor]
                                   withTextOffset:30.0f
                                  withPlaceholder:@"请输入正确的端口号"
                                  withBorderColor:[UIColor lightGrayColor]];

    tfRect.origin.y += 60;
    _wifiLabel = [UILabel createWithFrame:tfRect
                                 withText:@"是否处于WIFI状态"
                            withTextColor:[UIColor blackColor]];
    
    
    float l = 10;
    CGRect lightRect = _wifiLabel.frame;
    lightRect.origin.x += lightRect.size.width + 10;
    lightRect.origin.y += (lightRect.size.height-10)/2;
    lightRect.size.width = l;
    lightRect.size.height = l;
    _wifiLight = [UIView createCirCleWithFrame:lightRect
                                   withBgColor:[UIColor redColor]];
    
    tfRect.origin.y += 60;
    _startBtn = [UIButton createWithFrame:tfRect
                                withTitle:@"开始尝试连接"];
    [_startBtn addTarget:self action:@selector(startLink:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_ipTextField];
    [self.view addSubview:_portTextField];
    [self.view addSubview:_wifiLabel];
    [self.view addSubview:_wifiLight];
    [self.view addSubview:_startBtn];
}
- (void)startLink:(UIButton *)btn
{
    BOOL canLink = _reach.currentReachabilityStatus==ReachableViaWiFi ? YES : NO;
    
    NSString *ip = _ipTextField.text;
    NSString *port = _portTextField.text;
    
    if (canLink) {
    
        _socket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@", ip, port]]]];
        _socket.delegate = self;
        [_socket open];
    
    }else {
    
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"当前网络不在Wifi状态,无法进行连接"
                                   delegate:nil
                          cancelButtonTitle:@"好的,我去调整为Wifi模式"
                          otherButtonTitles:nil, nil] show];
    }
}

#pragma mark -
#pragma mark 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createUI];

    _ipTextField.text = [NSString localIPAddress];
    _portTextField.text = DEFAULT_PORT;

    _reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    [_reach startNotifier];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)reachabilityChanged:(NSNotification *)note
{
    if (_reach.currentReachabilityStatus == ReachableViaWiFi)
        _wifiLight.backgroundColor = [UIColor greenColor];
    else
        _wifiLight.backgroundColor = [UIColor redColor];
}

#pragma mark -
#pragma makr SRWebSocketDelegate

- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
{
    // 连接成功
    if (!_webVC) {
        _webVC = [[WebViewController alloc] init];
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    // 连接失败
    [self.navigationController popToRootViewControllerAnimated:YES];
    _webVC = nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
{
    // 接收消息
    
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;
{
    // 连接关闭
    [self.navigationController popToRootViewControllerAnimated:YES];
    _webVC = nil;
}

@end
