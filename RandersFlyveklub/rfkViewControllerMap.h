//
//  rfkDetailViewController.h
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DataControllerDelegate.h"
#import "DBDataController.h"


@interface rfkViewControllerMap : UIViewController <NSXMLParserDelegate>
{
@private
    NSXMLParser *xmlParser;
    NSInteger depth;
    NSMutableString *stationName;
    NSMutableString *lat;
    NSMutableString *lng;
    NSMutableString *temperature;
    NSMutableString *humid;
    
    NSMutableString *clouds;
    NSMutableString *observationTime;
    NSMutableString *windSpeed;
    NSMutableString *windDirection;
    NSMutableString *dewPoint;
    NSMutableString *weatherCondition;
    
    
    NSString *currentElement;
}

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (nonatomic, strong) id <DataControllerDelegate> dcDelegate2;
- (IBAction)ReturnKeyButton:(id)sender;
- (IBAction)backgroundTouched:(id)sender;


// Labels and buttons for weather info box
- (IBAction)buttonGetWeatherInfo:(id)sender;
//@property (weak, nonatomic) IBOutlet UITextField *textfieldICAO;

@property (weak, nonatomic) IBOutlet UITextField *textfieldInputICAO;

@property (weak, nonatomic) IBOutlet UILabel *labelSelected;
@property (weak, nonatomic) IBOutlet UILabel *labelObservationTime;
@property (weak, nonatomic) IBOutlet UILabel *labelWindDirection;
@property (weak, nonatomic) IBOutlet UILabel *labelWindSpeed;
@property (weak, nonatomic) IBOutlet UILabel *labelClouds;
@property (weak, nonatomic) IBOutlet UILabel *labelDewPoint;
@property (weak, nonatomic) IBOutlet UILabel *labelWeatherCondition;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperature;


@end
