//
//  ViewController.m
//  YouSoft_Mobile_10.8.16
//
//  Created by Carlos  Cepeda on 8/10/16.
//  Copyright (c) 2016 Carlos  Cepeda. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)saveCookies
{
    NSData         *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults    = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey: @"cookies"];
    [defaults synchronize];
}

- (void)loadCookies
{
    NSArray             *cookies       = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: @"cookies"]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSHTTPCookie *cookie in cookies)
    {
        [cookieStorage setCookie: cookie];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://www.yousoft.cl/login/mobile"];
    NSURLRequest *myrequest = [NSURLRequest requestWithURL:url];
    self.myWebView.scalesPageToFit = YES;
    
    
    
    [_myWebView loadRequest:myrequest];
    
    
    
    
    
    //    [self.myWebView setAutoresizesSubviews:YES];
    //    [self.myWebView setAutoresizingMask:
    //     UIViewAutoresizingFlexibleWidth |
    //     UIViewAutoresizingFlexibleHeight];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end