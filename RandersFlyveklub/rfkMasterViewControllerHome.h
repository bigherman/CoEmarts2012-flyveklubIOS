//
//  rfkMasterViewController.h
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class rfkDetailViewControllerHome;

@interface rfkMasterViewControllerHome : UITableViewController

@property (strong, nonatomic) rfkDetailViewControllerHome *detailViewController;

@property (strong, nonatomic) NSArray *items;

@end
