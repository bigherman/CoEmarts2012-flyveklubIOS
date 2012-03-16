//
//  rfkMasterViewController.m
//  RandersFlyveklub
//
//  Created by Mercantec EUC on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rfkMasterViewControllerContacts.h"
#import "rfkDetailViewControllerContacts.h"

//////
#import "DBDataControllerContacts.h"
#import "Contacts.h"

@implementation rfkMasterViewControllerContacts

@synthesize detailViewController = _detailViewController;
//@synthesize items;

@synthesize dcDelegate;

NSURLConnection *myConnection;
NSMutableData *receivedData;
NSMutableArray *contactList;
NSMutableArray *contactNamesArray;
NSMutableArray *contactNamesArrayEmail;
NSMutableArray *contactNamesArrayPhone;
NSString *nextContact;

NSString *dump;

- (void)getData
{
    
    NSURL *myURL = [NSURL URLWithString:@"http://spreadsheets.google.com/tq?tqx=out:csv&tq=select%20*&key=0Amm6nPGoxZiRdFVpYWRVYnZ3RHA2MXBOSEoyYXc5R3c"];
    
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    
    myConnection = [[NSURLConnection alloc] initWithRequest:myRequest delegate:self];
    
    if (myConnection)
        receivedData = [NSMutableData data];
    else
    {}
}

- (void)getContactsFromDB
{
    NSLog(@"I was here...");
    contactList = [[NSMutableArray alloc]init];
    contactList = [self.dcDelegate getAll:self];
    
    //NSLog(@"size: %@", [contactList count]);
    
    contactNamesArray      = [[NSMutableArray alloc] init];
    contactNamesArrayEmail = [[NSMutableArray alloc] init];
    contactNamesArrayPhone = [[NSMutableArray alloc] init];
    
    //NSMutableArray *contactNamesArray =  [[NSMutableArray alloc] init];
    for (Contacts *contact in contactList)
    {
        NSLog(@"Firstname: %@, Lastname: %@, Phone: %@, Email: %@", contact.first_name, contact.last_name, contact.phone, contact.email);
        
        nextContact = [NSString stringWithFormat:@"%@ %@", contact.first_name, contact.last_name];
        
        NSLog(@"Added: %@", nextContact);
        [contactNamesArray addObject:nextContact];
        [contactNamesArrayEmail addObject:contact.email];
        [contactNamesArrayPhone addObject:contact.phone];
    }
    
    // If Array is empty, then insert "Dummy"
    if ([contactNamesArray count] < 1)
    {
        [contactNamesArray addObject:@"No contacts"];
        [contactNamesArrayEmail addObject:@""];
        [contactNamesArrayPhone addObject:@""];
    }
    NSLog(@"count: %i", [contactNamesArray count]);
}

- (void)connection:(NSURLConnection *) connection didReceiveData:(NSData *)data
{
    if (connection == myConnection)
    {
        //NSLog(@"data: %@", dump);
        [receivedData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (connection == myConnection)
    {
        //if (delegate && [delegate respondsToSelector:successSelector]) {
        //    [delegate performSelector:successSelector withObject:connectionSpecificDataObject];
        //}
        //testLabel.text = receivedData;
        
        
        dump = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
        
        // Split on new lines
        NSArray *outputArray = [dump componentsSeparatedByString:@"\n"];
        BOOL reachedEnd = NO;
        
        //[self.dcDelegate getAll:self];
        
        
        /************************/
        // Function to flush all contacts from database
        //[self.dcDelegate flush_contacts_db];
        /************************/
        
        
        NSInteger *counter = 0;
        for (NSString *each in outputArray) // For each line
        {
            if (counter != 0)
            {
                // Split on commas
                NSArray *lineArray = [each componentsSeparatedByString:@","];
                NSMutableArray *tmpArray = [NSMutableArray array];
                for (NSString *each2 in lineArray) // For each cell in line
                {
                    if (each2.length == 0)
                    {
                        reachedEnd = YES;
                        break;
                    }
                    [tmpArray addObject:each2];
                }
                if (reachedEnd == YES)
                    break;
                
                if (sizeof(tmpArray) > 3)
                {
                    NSString *first_name = [tmpArray objectAtIndex:0];
                    NSString *last_name  = [tmpArray objectAtIndex:1];
                    NSString *phone      = [tmpArray objectAtIndex:2];
                    NSString *email      = [tmpArray objectAtIndex:3];
                    
                    
                    /************************/
                    // Insert each contact, one by one, into database.
                    // Cannot run at the same time as flush_contacts_db !
                    //[self.dcDelegate insert_into_contacts_db:first_name:last_name:phone:email];
                    /************************/
                    
                    
                    NSLog(@"1: %@ - 2: %@ - 3: %@ - 4: %@", first_name, last_name, phone, email);
                    [tmpArray removeAllObjects];
                }
            }
            counter = counter + 1;
        }
        [self.dcDelegate getAll:self];
        
        NSLog(@"### FINISHED ###");
        //NSLog(@"data: %@", dump);
    }
}

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.dcDelegate = [[DBDataControllerContacts alloc] init];
    
    [self getData];
    [self getContactsFromDB];
    
    self.detailViewController = (rfkDetailViewControllerContacts *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    //self.items = [NSArray arrayWithObjects: @"Contacts menuitem 1", @"Contacts menuitem 2", @"Contacts menuitem 3", nil];
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    
}

- (void)viewDidUnload
{
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

//############
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.items count];
    return [contactNamesArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Contacts at EKRD";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";  // Make sure it matches what you have in Storyboard!
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //cell.textLabel.text = [self.items objectAtIndex:indexPath.row]; // Set the MasterViewController's tableView row "Cell" to display selected array element
    
    
    /*
    contactList = [self.dcDelegate getAll:self];
    
    for (Contacts *contact in contactList)
    {
        NSLog(@"Firstname: %@, Lastname: %@, Phone: %@, Email: %@", contact.first_name, contact.last_name, contact.phone, contact.email);
    }
    */
    cell.textLabel.text = [contactNamesArray objectAtIndex:indexPath.row]; // Set the MasterViewController's tableView row "Cell" to display selected array element
    
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)path
{
//    self.detailViewController.detailItem = [self.items objectAtIndex:path.row];
//    self.detailViewController.labelName.text = [self.items objectAtIndex:path.row];
//    self.detailViewController.labelPhone.text = [self.items objectAtIndex:path.row];
//    self.detailViewController.labelEmail.text = [self.items objectAtIndex:path.row];

    self.detailViewController.detailItem = [contactNamesArray objectAtIndex:path.row];
    self.detailViewController.labelName.text = [contactNamesArray objectAtIndex:path.row];
    self.detailViewController.labelPhone.text = [contactNamesArrayPhone objectAtIndex:path.row];
    self.detailViewController.labelEmail.text = [contactNamesArrayEmail objectAtIndex:path.row];
    
}
//############

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
