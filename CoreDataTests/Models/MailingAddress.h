//
//  MailingAddress.h
//  HelloWorld_1
//
//  Created by Georgi Ivanov on 10/29/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Address.h"

@class Person;

@interface MailingAddress : Address

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * postalCode;
@property (nonatomic, retain) NSString * region;
@property (nonatomic, retain) NSString * street1;
@property (nonatomic, retain) NSString * street2;
@property (nonatomic, retain) Person *person;

@end
