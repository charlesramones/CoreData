//
//  CoreDataExampleViewController.m
//  CoreDataExample
//
//  Created by Charles Marlon G. Ramones on 11/9/12.
//  Copyright (c) 2012 Charles Marlon G. Ramones. All rights reserved.
//

#import "CoreDataExampleViewController.h"
#import "CoreDataExampleAppDelegate.h"
@interface CoreDataExampleViewController ()

@end

@implementation CoreDataExampleViewController
@synthesize name;
@synthesize address;
@synthesize number;
@synthesize findLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [name setDelegate:self];
    [address setDelegate:self];
    [number setDelegate:self];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setName:nil];
    [self setAddress:nil];
    [self setNumber:nil];
    [self setFindLabel:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(IBAction)save
{
    CoreDataExampleAppDelegate*appDelegate=[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext*context = [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
    [newContact setValue:name.text forKey:@"name"];
    [newContact setValue:address forKey:@"address"];
    [newContact setValue:number forKey:@"number"];
    name.text=@"";
    address.text= @"";
    number.text=@"";
    NSError*error;
    [context save:&error];
    findLabel.text=@"Contact Saved";
    
    
}
-(IBAction)find
{
    CoreDataExampleAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext*context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:context];
    NSFetchRequest *request= [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", name.text];
    [request setPredicate:pred];
    NSManagedObject*matches = nil;
    NSError*error;
    NSArray*objects = [context executeFetchRequest:request error:&error];
    if([objects count]==0){
        findLabel.text = @"no matches";
        
    }
    else{
        matches = [objects objectAtIndex:0];
        address.text = [matches valueForKey:@"address"];
        number.text = [matches valueForKey:"number"];
        
        
        findLabel.text = [NSString stringWithFormat:@"%d matches found", [objects count]];
        
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [name release];
    [address release];
    [number release];
    [findLabel release];
    
    [super dealloc];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}



@end
