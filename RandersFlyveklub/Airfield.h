//
//  Airfield.h
//  MyTest
//
//  Created by Paul Saunders on 11/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Airfield : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icao;
@property (nonatomic, copy) NSString *country;
@property (nonatomic) double lat;
@property (nonatomic) double lng;


@end
