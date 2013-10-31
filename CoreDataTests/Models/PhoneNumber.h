//
//  PhoneNumber.h
//  HelloWorld_1
//
//  Created by Georgi Ivanov on 10/29/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Address.h"

@class Person;

@interface PhoneNumber : Address

@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) Person *person;

@end
