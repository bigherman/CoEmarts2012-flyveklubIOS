//
//  rfkMasterViewController.m
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rfkViewControllerWeb.h"

@implementation rfkViewControllerWeb
@synthesize webpageTextfield;
@synthesize myWebView;

//@synthesize webpageTextfield;


- (void)setWebView:(NSString *)pageurl;
{
    NSString *urlAddress = pageurl;
    
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [myWebView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self setWebView:@"http://www.randersflyveklub.dk"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyWebView:nil];
    [self setWebpageTextfield:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


//##### Buttons
- (IBAction)btnRFK:(id)sender 
{
    [self setWebView:@"http://www.randersflyveklub.dk"];
}

- (IBAction)btnWebcam:(id)sender 
{
    [self setWebView:@"http://bambuser.com/v/2424946/transcode"];
}

- (IBAction)btnDMI:(id)sender 
{
    [self setWebView:@"http://www.dmi.dk"];
}

- (IBAction)btnAirfields:(id)sender 
{
    [self setWebView:@"http://www.airfields.dk"];
}


-(IBAction)ReturnKeyButton:(id)sender
{
    NSString *weburl = webpageTextfield.text;
    NSString *fullUrl = [NSString stringWithFormat:@"http://%@", weburl];
    
    [self setWebView:fullUrl];
}


@end
