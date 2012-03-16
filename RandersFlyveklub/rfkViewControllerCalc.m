//
//  rfkMasterViewController.m
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rfkViewControllerCalc.h"

@implementation rfkViewControllerCalc
@synthesize labelAir;
@synthesize labelGround;
@synthesize myTextField1;
@synthesize myTextField2;
@synthesize myTextField3;
@synthesize myTextField4;
@synthesize myTextField5;
@synthesize myTextField6;
@synthesize myTextField7;
@synthesize myTextField8;


float height, speed, IAS, windDir, windSpeed, trk, TAS, MACH, GS;
float PI, g, R, lambda, T0, TropT, ftm, P0, TropP;
float pres, temp, pow1, pow2, relDen, MACH1, windAng, windComp, drift, heading, rad, deg;
int trkInt, driftInt, headingInt;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyTextField1:nil];
    [self setMyTextField2:nil];
    [self setMyTextField3:nil];
    [self setMyTextField4:nil];
    [self setMyTextField5:nil];
    [self setMyTextField6:nil];
    [self setMyTextField7:nil];
    [self setMyTextField8:nil];
    [self setLabelAir:nil];
    [self setLabelGround:nil];
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
    
    //[myTextField1 becomeFirstResponder];
    PI = 3.14159265;
    g = 9.81;
    R = 287;
    lambda = 0.00198;
    T0 = 288;
    TropT = 216.5;
    ftm = 3.28126;
    P0 = 1013.25;
    TropP = 226;
    
    pres = 0.0;
    temp = 0.0;
    relDen = 0.0;
    MACH1 = 0.0;
    windAng = 0.0;
    windComp = 0.0;
    drift = 0.0;
    heading = 0.0;
    rad = 0.0;
    deg = 0.0;
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
    //return (interfaceOrientation != UIInterfaceOrientationLandscapeLeft && interfaceOrientation != UIInterfaceOrientationLandscapeRight);
    
    // Return YES for supported orientations
    return YES;
}

- (void)inputValidate
{
    int heightAlert = [myTextField1.text intValue];
    int IASAlert = [myTextField2.text intValue];
    int windDirAlert = [myTextField3.text intValue];
    int windSpeedAlert = [myTextField4.text intValue];
    int trkAlert = [myTextField5.text intValue];
    
    NSString *heightStatus = @"Height: OK";
    NSString *IASStatus = @"IAS: OK";
    NSString *windDirStatus = @"Wind Dir: OK";
    NSString *windSpeedStatus = @"Wind Speed: OK";
    NSString *trkStatus = @"Track: OK";
    NSString *errorCode = @"Error in";
    
    BOOL errorFound = NO; {
        
        if (-5000 > heightAlert || heightAlert > 99999) {
            errorFound = YES;
            heightStatus = @"Height: Fejl";
            errorCode = @"Error in height \n Min: -5000 Max: 99999";
        }
        
        else if (0 > IASAlert || IASAlert > 1500) {
            errorFound = YES;
            IASStatus = @"IAS: Fejl";
            errorCode = @"Error in IAS \n Min: 0 Max: 1500";
        }
        
        else if (0 > windDirAlert || windDirAlert > 359) {
            errorFound = YES;
            windDirStatus = @"Wind Dir: Fejl";
            errorCode = @"Error in Wind Dir \n Min: 0 Max: 359";
        }
        
        else if (0 > windSpeedAlert || windSpeedAlert > 250) {
            errorFound = YES;
            windSpeedStatus = @"Wind Speed: Fejl";
            errorCode = @"Error in Wind Speed \n Min: 0 Max: 250 ";
            
        }
        
        else if (0 > trkAlert || trkAlert > 359) {
            errorFound = YES;
            trkStatus = @"Track: Fejl";
            errorCode = @"Error in Track \n Min: 0 Max: 359";
        }
        
        
        if (errorFound == YES) {
            UIAlertView *inputVal = [[UIAlertView alloc] initWithTitle:@"Status" message:errorCode delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            
            [inputVal show];
        }
        
    }    
    /*  if (heightAlert > 300)
     {
     UIAlertView *test = [[UIAlertView alloc] initWithTitle:@"title" message:@"besked" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
     
     [test show];
     myTextField1.text = @"";
     
     }
     
     if (IASAlert > 300)
     {
     UIAlertView *test = [[UIAlertView alloc] initWithTitle:@"title" message:@"besked" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
     
     [test show];
     myTextField2.text = @"";
     
     }
     
     if (windDirAlert > 300)
     {
     UIAlertView *test = [[UIAlertView alloc] initWithTitle:@"title" message:@"besked"  delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
     
     [test show];
     myTextField3.text = @"";
     
     }
     
     if (windSpeedAlert > 300)
     {
     UIAlertView *test = [[UIAlertView alloc] initWithTitle:@"title" message:@"besked" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
     
     [test show];
     myTextField4.text = @"";
     
     }
     
     if (trkAlert > 300)
     {
     UIAlertView *test = [[UIAlertView alloc] initWithTitle:@"title" message:@"besked" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
     
     [test show];
     myTextField5.text = @"";
     
     }
     */
}

- (void)calculate
{
    height = [myTextField1.text floatValue];
    IAS = [myTextField2.text floatValue];
    windDir = [myTextField3.text floatValue];
    windSpeed = [myTextField4.text floatValue];
    trk = [myTextField5.text floatValue];
    TAS = 0.0;
    MACH = 0.0;
    GS = 0.0;
    
    
    //Pressure
    if (height < 36090){
        pow1 = (1 - (lambda * height / T0));        
        pow2 = (g / (R * lambda * ftm));
        pres = powf(pow1, pow2);
        pres = P0 * pres;
    }
    else {
        pres = TropP * exp(-g * ((height-36090) / ftm) / (R * TropT));
    }
    
    
    //Temperature
    if (height < 36090){
        temp = 288 - ((height / 1000) * 1.98);
    }
    else {
        temp = 216.5;
    }
    
    
    //RelDensity
    relDen = (3.51823 / (pres / temp));
    
    
    //Heading
    rad = PI / 180;
    deg = 180 / PI;
    windAng = rad * (trk - windDir);
    windComp = sinf(windAng) * windSpeed / TAS;
    drift = deg * (asinf(windComp));
    trkInt = round(trk);
    driftInt = round(drift);
    headingInt = (360 + trkInt - driftInt) %360;
    heading = (float) headingInt;
    
    //TAS
    TAS = sqrtf(relDen) * IAS;
    
    
    //MACH
    MACH1 = 38.9 * sqrtf(temp);
    MACH = TAS / MACH1;
    
    //Ground Speed
    windAng = rad * (heading - windDir);
    GS = TAS - windSpeed * cosf(windAng);
    
    
    myTextField6.text = [NSString stringWithFormat:@"%.2f", TAS];
    labelAir.text = [NSString stringWithFormat:@"True Air Speed: %.2f knots (MACH: %.2f)", TAS, MACH];
    myTextField7.text = [NSString stringWithFormat:@"%.2f", MACH];
    myTextField8.text = [NSString stringWithFormat:@"%.2f", GS]; 
    labelGround.text = [NSString stringWithFormat:@"Ground Speed: %.2f knots", GS];
    
}

- (IBAction)minusButton:(id)sender {
    height = [myTextField1.text floatValue];
    height = (height - height * 2);
    myTextField1.text = [NSString stringWithFormat:@"%.2f", height];
}

- (IBAction)myButtonTouched:(id)sender {
    [self inputValidate];
    [self calculate];
}

- (IBAction)clearButton:(id)sender {
    myTextField1.text = @"0";
    myTextField2.text = @"0";
    myTextField3.text = @"0";
    myTextField4.text = @"0";
    myTextField5.text = @"0";
    myTextField6.text = @"";
    myTextField7.text = @"";
    myTextField8.text = @"";
    labelAir.text     = @"";
    labelGround.text  = @"";
}

-(IBAction)ReturnKeyButton:(id)sender
{
    [self inputValidate];
    [sender resignFirstResponder];
    [self calculate];
}
-(IBAction)backgroundTouched:(id)sender
{
    [myTextField1 resignFirstResponder];
    [myTextField2 resignFirstResponder];
    [myTextField3 resignFirstResponder];
    [myTextField4 resignFirstResponder];
    [myTextField5 resignFirstResponder];
    [self inputValidate];
}
@end
