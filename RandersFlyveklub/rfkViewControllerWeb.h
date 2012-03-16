//
//  rfkMasterViewController.h
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface rfkViewControllerWeb : UIViewController

- (IBAction)ReturnKeyButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
- (IBAction)btnDMI:(id)sender;
- (IBAction)btnAirfields:(id)sender;
- (IBAction)btnRFK:(id)sender;
- (IBAction)btnWebcam:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *webpageTextfield;
@end