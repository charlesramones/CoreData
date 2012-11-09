//
//  CoreDataExampleAppDelegate.h
//  CoreDataExample
//
//  Created by Charles Marlon G. Ramones on 11/9/12.
//  Copyright (c) 2012 Charles Marlon G. Ramones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataExampleAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(nonatomic, retain) UINavigationController*navigationController;



- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
