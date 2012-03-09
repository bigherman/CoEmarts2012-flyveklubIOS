//
//  rfkMasterViewController.h
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class rfkDetailViewController;

@interface rfkMasterViewControllerHome : UITableViewController

@property (strong, nonatomic) rfkDetailViewController *detailViewController;

@end
