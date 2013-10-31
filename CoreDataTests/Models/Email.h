//
//  Email.h
//  HelloWorld_1
//
//  Created by Georgi Ivanov on 10/29/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Address.h"

@class Person;

@interface Email : Address

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) Person *person;

@end
