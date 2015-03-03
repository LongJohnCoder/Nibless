//
//  WebViewViewController.m
//  CustomCell
//
//  Created by Marty Burolla on 3/3/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "WebViewViewController.h"
#import "Masonry.h"

@interface WebViewViewController()
@property (nonatomic, strong) UIWebView* webView;
@end

@implementation WebViewViewController

-(instancetype) init
{    
    self = [super init];
    if (self!=nil) {
        self.view.backgroundColor = [UIColor whiteColor];
        [self setUpWebview];
        [self setUpWebViewConstraints];
    }
    return self;
}

-(void)setUpWebview
{
    _webView = [[UIWebView alloc]init];
    [_webView setMediaPlaybackRequiresUserAction:NO];
    _webView.delegate = nil;
    
    NSURL *url = [NSURL URLWithString: @"http://www.google.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest: urlRequest];
    [self.view addSubview: _webView];
    
    
    /*
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 10,300, 200)];
    [self.webView setAllowsInlineMediaPlayback:YES];
    [self.webView setMediaPlaybackRequiresUserAction:NO];
    
    [self.view addSubview:self.webView];
    
    NSString* embedHTML = [NSString stringWithFormat:@"\
                           <html>\
                           <body style='margin:0px;padding:0px;'>\
                           <script type='text/javascript' src='http://www.youtube.com/iframe_api'></script>\
                           <script type='text/javascript'>\
                           function onYouTubeIframeAPIReady()\
                           {\
                           ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})\
                           }\
                           function onPlayerReady(a)\
                           { \
                           a.target.playVideo(); \
                           }\
                           </script>\
                           <iframe id='playerId' type='text/html' width='%d' height='%d' src='http://www.youtube.com/embed/%@?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'>\
                           </body>\
                           </html>", 300, 200, @"JW5meKfy3fY"];
    
    [self.webView loadHTMLString:embedHTML baseURL:[[NSBundle mainBundle] resourceURL]];
    [self.view addSubview: _webView];
     */
    
}

-(void)setUpWebViewConstraints
{
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}

@end
