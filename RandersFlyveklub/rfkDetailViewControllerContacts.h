//
//  rfkDetailViewController.h
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface rfkDetailViewControllerContacts : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

// Labels for contact info
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPhone;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;

// button to mail app
- (IBAction)buttonSendMail:(id)sender;
@end
