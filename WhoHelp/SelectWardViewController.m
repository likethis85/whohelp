//
//  SelectWardViewController.m
//  WhoHelp
//
//  Created by Dai Cloud on 11-12-29.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "SelectWardViewController.h"
#import "CustomItems.h"

@implementation SelectWardViewController

@synthesize hlVC=hlVC_;
@synthesize wardTextField=wardTextField_;
@synthesize tableView=tableView_;

- (void)dealloc
{
    [wardCategories_ release];
    [wardTextField_ release];
    [hlVC_ release];
    [tableView_ release];
    [super dealloc];
}

- (NSArray *)wardCategories
{
    if (wardCategories_ == nil){
        // read the plist loud category configure
        NSString *myFile = [[NSBundle mainBundle] pathForResource:@"payCate" ofType:@"plist"];
        NSDictionary *payCates = [NSDictionary dictionaryWithContentsOfFile:myFile];
        wardCategories_ = [[NSArray alloc] initWithObjects:                           
                           [payCates allValues],
                           nil]; 
    }
    return wardCategories_;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set table header view
    CGRect frame;
    frame = CGRectMake(0, 0, 320, 40);

    UITextField *wardDescView = [[[UITextField alloc] initWithFrame:frame] autorelease];
    wardDescView.placeholder = @"意思一下总是要的嘛";
    wardDescView.font = [UIFont systemFontOfSize:18.0f];
    wardDescView.opaque = YES;
    wardDescView.keyboardType = UIKeyboardTypeDefault;
    wardDescView.keyboardAppearance = UIKeyboardAppearanceDefault;
    wardDescView.returnKeyType = UIReturnKeyDone;
    wardDescView.delegate = self;
    
    self.wardTextField = wardDescView;
    self.tableView.tableHeaderView = wardDescView;
    
    
    // custom navigation item
    self.navigationItem.titleView = [[[NavTitleLabel alloc] initWithTitle:@"选择你的报酬"] autorelease];
    
    self.navigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] 
                                              initBackBarButtonItemWithTarget:self 
                                              action:@selector(backAction:)] autorelease];
    
}

-(void)backAction:(id)sender
{
     self.hlVC.wardText = self.wardTextField.text;
    [self.navigationController popViewControllerAnimated:YES];
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
    // set back to send view controller ward desc text
    
}

#pragma mark - dimiss the keyboard

//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
////    [textField resignFirstResponder];
//    NSLog(@"fuck fuck fuck");
//    return YES;
//}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return [self.wardCategories count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [[self.wardCategories objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSDictionary *helpCategory = [[self.wardCategories objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = [helpCategory valueForKey:@"text"];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view data source

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (section == [self.wardCategories count] - 1){
//        return 10.0f;
//    }
//    return 0.0f;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    CGRect frame;
//    
//    
//    frame = CGRectMake(0, 0, 320, 40);
//    UIImageView *imageView = [[[UIImageView alloc] initWithFrame:frame] autorelease];
//    imageView.image = [UIImage imageNamed:@"avatar.png"];
//    imageView.opaque = YES;
//    
//    
//    return imageView;
//}

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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    self.hlVC.wardCategory = [[self.wardCategories objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    //[self.navigationController popViewControllerAnimated:YES];
}

@end
