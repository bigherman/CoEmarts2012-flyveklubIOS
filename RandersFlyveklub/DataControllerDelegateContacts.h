//  DataControllerDelegate.h
//
//  Created by Paul Saunders on 11/03/2012.
//  Copyright (c) 2012 EUC Mercantec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class rfkMasterViewControllerContacts;
@class Contacts;

@protocol DataControllerDelegateContacts <NSObject>

- (NSMutableArray *) getAll:(rfkMasterViewControllerContacts *)controller;
- (void)flush_contacts_db;
- (void)insert_into_contacts_db:(NSString *)first_name:(NSString *)last_name:(NSString *)Phone:(NSString *)email;
//- (NSMutableArray *) getRegion:(SecondViewController *)controller, int minLat, int maxLat, int minLong, int maxLong;
//- (void) insert:(rfkViewController *)controller Contacts:(Contacts *)contact;
//- (void) update:(rfkViewController *)controller atIndex:(int)index;
//- (void) remove:(rfkViewController *)controller atIndex:(int)index;

@end
