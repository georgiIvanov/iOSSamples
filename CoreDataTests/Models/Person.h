//
//  Person.h
//  HelloWorld_1
//
//  Created by Georgi Ivanov on 10/29/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Email, MailingAddress, PhoneNumber;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSSet *mailingAddress;
@property (nonatomic, retain) NSSet *phoneNumbers;
@property (nonatomic, retain) NSSet *emailAddresses;
@property (nonatomic, retain) NSString* fullName;

@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addMailingAddressObject:(MailingAddress *)value;
- (void)removeMailingAddressObject:(MailingAddress *)value;
- (void)addMailingAddress:(NSSet *)values;
- (void)removeMailingAddress:(NSSet *)values;

- (void)addPhoneNumbersObject:(PhoneNumber *)value;
- (void)removePhoneNumbersObject:(PhoneNumber *)value;
- (void)addPhoneNumbers:(NSSet *)values;
- (void)removePhoneNumbers:(NSSet *)values;

- (void)addEmailAddressesObject:(Email *)value;
- (void)removeEmailAddressesObject:(Email *)value;
- (void)addEmailAddresses:(NSSet *)values;
- (void)removeEmailAddresses:(NSSet *)values;

@end
