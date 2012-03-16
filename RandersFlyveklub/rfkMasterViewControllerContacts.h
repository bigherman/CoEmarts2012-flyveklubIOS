//
//  rfkMasterViewController.h
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DataControllerDelegateContacts.h"
#import "DBDataControllerContacts.h"

@class rfkDetailViewControllerContacts;

@interface rfkMasterViewControllerContacts : UITableViewController

@property (strong, nonatomic) rfkDetailViewControllerContacts *detailViewController;

//@property (strong, nonatomic) NSArray *items;

@property (nonatomic, strong) id <DataControllerDelegateContacts> dcDelegate;

@end
