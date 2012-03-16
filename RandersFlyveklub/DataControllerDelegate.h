//  DataControllerDelegate.h
//
//  Created by Paul Saunders on 11/03/2012.
//  Copyright (c) 2012 EUC Mercantec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  rfkViewControllerMap;
@class Airfield;

@protocol DataControllerDelegate <NSObject>

- (NSMutableArray *) getAll:(rfkViewControllerMap *)controller;
- (NSMutableArray *) getRegion:(rfkViewControllerMap *)controller, int minLat, int maxLat, int minLong, int maxLong;
//- (void) insert:(SecondViewController *)controller Airfield:(Airfield *)airfield;
//- (void) update:(SecondViewController *)controller atIndex:(int)index;
//- (void) remove:(SecondViewController *)controller atIndex:(int)index;

@end
