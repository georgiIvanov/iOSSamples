//
//  APAddressBookImporter.h
//  CoreDataTests
//
//  Created by Georgi Ivanov on 10/30/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface APAddressBookImporter : NSObject
-(id)initWithParentObjectContext:(NSManagedObjectContext*) parent;
-(void)beginImportingWithCompletion:(void (^)(NSError* error)) completion;
@end
