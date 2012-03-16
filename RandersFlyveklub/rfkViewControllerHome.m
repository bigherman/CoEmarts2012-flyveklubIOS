//
//  rfkMasterViewController.m
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rfkViewControllerHome.h"

@implementation rfkViewControllerHome
@synthesize labelWindSpeed;
@synthesize labelWindDirection;
@synthesize labelTemperature;
@synthesize labelHPa;
@synthesize labelTime;

///////////////////
NSURLConnection *theConnection;
NSMutableData *receivedData;
NSString *rawData;
NSData *dataOne;
NSString *dataNew;
NSString *dataOld;

- (void)didReceiveMemoryWarning
{
    [self didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) getWeather
{
    receivedData = [[NSMutableData alloc] init];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.randersflyveklub.dk/vejr/clientraw.txt"] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
    
    theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //myTextField.textColor = [UIColor redColor];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (theConnection == nil) 
    { 
    }
    else 
    {
        rawData = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
        
        //NSLog(@" here is the data: %@", rawData);
        NSArray *arrayData = [rawData componentsSeparatedByString:@" "];
        NSLog(@" here is the data: %@", arrayData);
        
        // Wind speed
        labelWindSpeed.text = [arrayData objectAtIndex:1];
        NSLog(@"%@", [arrayData objectAtIndex:1]);
        
        // Wind direction
        labelWindDirection.text = [arrayData objectAtIndex:3];
        NSLog(@"%@", [arrayData objectAtIndex:3]);
        
        // Temperature
        labelTemperature.text = [arrayData objectAtIndex:4];
        NSLog(@"%@", [arrayData objectAtIndex:4]);
        
        // hPa
        labelHPa.text = [arrayData objectAtIndex:6];
        NSLog(@"%@", [arrayData objectAtIndex:6]);
        
        labelTime.text = [arrayData objectAtIndex:32];
        NSLog(@"%@", [arrayData objectAtIndex:32]);
        
        dataNew = [arrayData objectAtIndex:32];
        
        if (dataOld == dataNew) 
        {
            //myTextField.textColor = [UIColor redColor];
        }
        else 
        {
            dataOld = dataNew;
            //myTextField.textColor = [UIColor blueColor];
        }
        
        theConnection = nil;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self getWeather];
    dataOld = 00;
    [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(getWeather) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [self setLabelWindSpeed:nil];
    [self setLabelWindDirection:nil];
    [self setLabelTemperature:nil];
    [self setLabelHPa:nil];
    [self setLabelTime:nil];
    [super viewDidUnload];
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




@end
