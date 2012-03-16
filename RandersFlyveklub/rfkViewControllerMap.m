//
//  rfkDetailViewController.m
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rfkViewControllerMap.h"
#import "Airfield.h"

@implementation rfkViewControllerMap
@synthesize labelSelected;
@synthesize labelObservationTime;
@synthesize labelWindDirection;
@synthesize labelWindSpeed;
@synthesize labelClouds;
@synthesize labelDewPoint;
@synthesize labelWeatherCondition;
@synthesize labelTemperature;
@synthesize myMapView;
@synthesize dcDelegate2;
@synthesize textfieldInputICAO;

NSString* dump;
NSMutableArray *airfieldList;


////////
NSURLConnection *theConnection;
NSMutableData *receivedData;
NSString* xml;
NSData *dataOne;
////////

/*
- (void)setLocation
{
    // Map center
    myMapView.mapType = MKMapTypeSatellite;
    MKCoordinateRegion myRegion;
    myRegion.center.latitude = 56.45642;
    myRegion.center.longitude = 10.041504;
    myRegion.span.latitudeDelta = 1.484802;
    myRegion.span.longitudeDelta = 4.513623;
    
    // coordinates for pin
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 56.45642;
    coordinate.longitude = 10.041504;
    
    // Create pin
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coordinate];
    [annotation setTitle:@"Randers"];
    [annotation setSubtitle:@"some subtitle here..."];
    [self.myMapView removeAnnotations:self.myMapView.annotations];
    [self.myMapView addAnnotation:annotation];
    
    
    [self.myMapView setRegion:myRegion animated:YES];
}
 */
/*
- (void)showMap
{
    // Map center
    myMapView.mapType = MKMapTypeSatellite;
    MKCoordinateRegion myRegion;
    myRegion.center.latitude = 56.45642;
    myRegion.center.longitude = 10.041504;
    myRegion.span.latitudeDelta = 1.484802;
    myRegion.span.longitudeDelta = 4.513623;
    
    [self.myMapView setRegion:myRegion animated:YES];
}
 */
/*
- (void)addPin:(double)lat:(double)lng:(NSString *)title:(NSString *)subtitle
{
    // coordinates for pin
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = lat;
    coordinate.longitude = lng;
    
    // Create pin
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coordinate];
    [annotation setTitle:title];
    [annotation setSubtitle:subtitle];
    [self.myMapView removeAnnotations:self.myMapView.annotations];
    [self.myMapView addAnnotation:annotation];
    
    
    //[self.myMapView setRegion:myRegion animated:YES];
}
*/ 
/*
- (void)getAirfields
{
    self.dcDelegate2 = [[DBDataController alloc] init];
    
    airfieldList = [self.dcDelegate2 getAll:self];
    
    for (Airfield *airfield in airfieldList)
    {
        [self addPin:airfield.lat:airfield.lng:airfield.name:@"my subtitle..."];
        
        NSLog(@"name: %@, icao: %@, country: %@, lat: %.2f, long: %.2f", airfield.name, airfield.icao, airfield.country, airfield.lat, airfield.lng);
    }
}
*/
 
- (void)getMapWithPins
{
    // Map center
    myMapView.mapType = MKMapTypeSatellite;
    MKCoordinateRegion myRegion;
    myRegion.center.latitude = 56.206704;
    myRegion.center.longitude = 11.282959;
    myRegion.span.latitudeDelta = 3.6118;
    myRegion.span.longitudeDelta = 9.195557;
    
    // Clear all annotations
    [self.myMapView removeAnnotations:self.myMapView.annotations];
    
    // Database...
    self.dcDelegate2 = [[DBDataController alloc] init];
    airfieldList = [self.dcDelegate2 getAll:self];
    NSInteger count = 0;
    for (Airfield *airfield in airfieldList)
    {
        CLLocationCoordinate2D coordinate1 ;
        coordinate1.latitude = airfield.lat;
        coordinate1.longitude = airfield.lng;
        MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
        [myAnnotation setCoordinate:coordinate1];
        [myAnnotation setTitle:airfield.name];
        [myAnnotation setSubtitle:airfield.icao];
        
        /*
        UIButton *myButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        myButton.frame = CGRectMake(0, 0, 44, 44);
        myButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        myButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        [myButton addTarget:self action:@selector(showDetails) forControlEvents:UIControlEventTouchUpInside ];
        
        myAnnotation
        */
        
        //[myAnnotation setSubtitle:@"Some subtitle here..."];
        
        [self.myMapView addAnnotation:myAnnotation];
        
        NSLog(@"name: %@, icao: %@, country: %@, lat: %.2f, long: %.2f", airfield.name, airfield.icao, airfield.country, airfield.lat, airfield.lng);
        
        count = count + 1;
    }
    //NSLog(@"Total: %i", count);

    [self.myMapView setRegion:myRegion animated:YES];
}



/*
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"been here...");
    if (!view.rightCalloutAccessoryView)
    {
        UIButton *myButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.rightCalloutAccessoryView = myButton;
        myButton.frame = CGRectMake(0, 0, 44, 44);
        myButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        myButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
}
*/

/*
- (void)setLocations
{
    // Map center
    myMapView.mapType = MKMapTypeSatellite;
    MKCoordinateRegion myRegion;
    myRegion.center.latitude = 56.45642;
    myRegion.center.longitude = 10.041504;
    myRegion.span.latitudeDelta = 1.484802;
    myRegion.span.longitudeDelta = 4.513623;
    
    // pin 1
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 56.45642;
    coordinate1.longitude = 10.041504;
    MKPointAnnotation *annotation1 = [[MKPointAnnotation alloc] init];
    [annotation1 setCoordinate:coordinate1];
    [annotation1 setTitle:@"Randers"];
    [annotation1 setSubtitle:@"Some subtitle here..."];
    // pin 2
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 56.452027;
    coordinate2.longitude = 9.396347;
    MKPointAnnotation *annotation2 = [[MKPointAnnotation alloc] init];
    [annotation2 setCoordinate:coordinate2];
    [annotation2 setTitle:@"Viborg"];
    [annotation2 setSubtitle:@"Some subtitle here..."];
    // pin 3
    CLLocationCoordinate2D coordinate3;
    coordinate3.latitude = 57.072469;
    coordinate3.longitude = 9.903831;
    MKPointAnnotation *annotation3 = [[MKPointAnnotation alloc] init];
    [annotation3 setCoordinate:coordinate3];
    [annotation3 setTitle:@"Aalborg"];
    [annotation3 setSubtitle:@"Some subtitle here..."];
    
    [self.myMapView removeAnnotations:self.myMapView.annotations];
    [self.myMapView addAnnotation:annotation1];
    [self.myMapView addAnnotation:annotation2];
    [self.myMapView addAnnotation:annotation3];
    
    
    [self.myMapView setRegion:myRegion animated:YES];
}
*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self getMapWithPins];
    
    [super viewDidLoad];
}


//////// START //////////////
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (theConnection) {
        xml = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
        xmlParser = [[NSXMLParser alloc] initWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
        [xmlParser setDelegate:self];
        [xmlParser setShouldProcessNamespaces:NO];
        [xmlParser setShouldReportNamespacePrefixes:NO];
        [xmlParser setShouldResolveExternalEntities:NO];
        [xmlParser parse];
        NSLog(@" here is the data: %@", xml);
    }
} 

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    depth = 0;
    currentElement = nil;
    stationName = [[NSMutableString alloc] init];
    lat = [[NSMutableString alloc] init];
    lng = [[NSMutableString alloc] init];
    temperature = [[NSMutableString alloc] init];
    humid = [[NSMutableString alloc] init];
    clouds = [[NSMutableString alloc] init];;
    observationTime = [[NSMutableString alloc] init];;
    windSpeed = [[NSMutableString alloc] init];;
    windDirection = [[NSMutableString alloc] init];;
    dewPoint = [[NSMutableString alloc] init];;
    weatherCondition = [[NSMutableString alloc] init];;
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"Error: %@", [parseError localizedDescription]);
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentElement = [elementName copy];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([currentElement isEqualToString:@"stationName"]) 
        [stationName appendString:string];
    if ([currentElement isEqualToString:@"lat"]) 
        [lat appendString:string];
    if ([currentElement isEqualToString:@"lng"]) 
        [lng appendString:string];
    if ([currentElement isEqualToString:@"humidity"]) 
        [humid appendString:string];
    if ([currentElement isEqualToString:@"temperature"]) 
        [temperature appendString:string];
    if ([currentElement isEqualToString:@"clouds"]) 
        [clouds appendString:string];
    if ([currentElement isEqualToString:@"observationTime"]) 
        [observationTime appendString:string];
    if ([currentElement isEqualToString:@"windSpeed"]) 
        [windSpeed appendString:string];
    if ([currentElement isEqualToString:@"windDirection"]) 
        [windDirection appendString:string];
    if ([currentElement isEqualToString:@"dewPoint"]) 
        [dewPoint appendString:string];
    if ([currentElement isEqualToString:@"weatherCondition"]) 
        [weatherCondition appendString:string];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    // Change values of "weather info box"
    labelSelected.text = stationName;
    labelObservationTime.text = observationTime;
    labelWindDirection.text = windDirection;
    labelWindSpeed.text = windSpeed;
    labelClouds.text = clouds;
    labelDewPoint.text = dewPoint;
    labelWeatherCondition.text = weatherCondition;
    labelTemperature.text = [NSString stringWithFormat:@"%@°C", temperature];
    
    /*
    // Show alert box
    NSString *alertText = [NSString stringWithFormat:@"Observation time: %@\nWind direction: %@\nWind Speed: %@\nClouds: %@\nDew point: %@\nWeather Condition: %@", observationTime, windDirection, windSpeed, clouds, dewPoint, weatherCondition]; 
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:stationName 
                                                    message:alertText
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
     */
}
///////// END //////////////


- (void)viewDidUnload
{
    [self setMyMapView:nil];
    [self setLabelSelected:nil];
    [self setLabelObservationTime:nil];
    [self setLabelWindDirection:nil];
    [self setLabelWindSpeed:nil];
    [self setLabelClouds:nil];
    [self setLabelDewPoint:nil];
    [self setLabelWeatherCondition:nil];
    [self setTextfieldInputICAO:nil];
    [self setLabelTemperature:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)callWebService
{
    NSLog(@"button is pushed...");
    NSString *icaoInput = textfieldInputICAO.text;
    
    
    receivedData = [[NSMutableData alloc] init];
    
    NSString *url = [NSString stringWithFormat:@"http://api.geonames.org/weatherIcao?ICAO=%@&username=okdios&style=full", icaoInput];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
}

- (IBAction)buttonGetWeatherInfo:(id)sender 
{
    [sender resignFirstResponder];
    [self callWebService];
}

-(IBAction)ReturnKeyButton:(id)sender
{
    [sender resignFirstResponder];
    [self callWebService];
}
-(IBAction)backgroundTouched:(id)sender
{
    
}

@end