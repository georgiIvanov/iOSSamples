//
//  AppDelegate.h
//  CoreDataTests
//
//  Created by Georgi Ivanov on 10/29/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (readonly, strong, nonatomic) NSArray *personSortDescriptors;
@property (readonly, strong, nonatomic) NSArray *labelSortDescriptors;

- (IBAction)saveAction:(id)sender;

@end
