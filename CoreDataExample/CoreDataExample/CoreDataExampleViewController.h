//
//  CoreDataExampleViewController.h
//  CoreDataExample
//
//  Created by Charles Marlon G. Ramones on 11/9/12.
//  Copyright (c) 2012 Charles Marlon G. Ramones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataExampleViewController : UIViewController <UITextFieldDelegate>


{
    
    
    
    
    
}
@property (retain, nonatomic) IBOutlet UITextField *name;
@property (retain, nonatomic) IBOutlet UITextField *address;
@property (retain, nonatomic) IBOutlet UITextField *number;
@property (retain, nonatomic) IBOutlet UILabel *findLabel;
-(IBAction)save;
-(IBAction)find;

@end
