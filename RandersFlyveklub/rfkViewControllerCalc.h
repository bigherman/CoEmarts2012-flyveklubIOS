//
//  rfkMasterViewController.h
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rfkViewControllerCalc : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *myTextField1;
@property (weak, nonatomic) IBOutlet UITextField *myTextField2;
@property (weak, nonatomic) IBOutlet UITextField *myTextField3;
@property (weak, nonatomic) IBOutlet UITextField *myTextField4;
@property (weak, nonatomic) IBOutlet UITextField *myTextField5;
@property (weak, nonatomic) IBOutlet UITextField *myTextField6;
@property (weak, nonatomic) IBOutlet UITextField *myTextField7;
@property (weak, nonatomic) IBOutlet UITextField *myTextField8;

- (IBAction)minusButton:(id)sender;
- (IBAction)myButtonTouched:(id)sender;
- (IBAction)clearButton:(id)sender;

- (IBAction)ReturnKeyButton:(id)sender;
- (IBAction)backgroundTouched:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelAir;
@property (weak, nonatomic) IBOutlet UILabel *labelGround;
@end