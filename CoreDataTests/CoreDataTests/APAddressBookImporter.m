//
//  APAddressBookImporter.m
//  CoreDataTests
//
//  Created by Georgi Ivanov on 10/30/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import "APAddressBookImporter.h"
#import <AddressBook/AddressBook.h>
#import <AddressBook/ABGlobals.h>

#import "Person.h"
#import "MailingAddress.h"
#import "Email.h"
#import "PhoneNumber.h"

@interface APAddressBookImporter()
@property (nonatomic, copy) void (^completionHandler)(NSError*);

@end

@implementation APAddressBookImporter
{
    NSManagedObjectContext* _context;
}

-(id) initWithParentObjectContext:(NSManagedObjectContext *)parent
{
    self = [super init];
    if(self == nil)
        return (nil);
    
    _context = [[NSManagedObjectContext alloc]
                initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    
    [_context setParentContext:parent];
    //it has a parent, so it doesn't need a persistentStoreCoordinator
    
    return (self);
}

-(void) beginImportingWithCompletion:(void (^)(NSError *))completion
{
    self.completionHandler = completion;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        ABAddressBook *addressBook = [ABAddressBook addressBook];
        
        NSEntityDescription *entity = [NSEntityDescription
                                       entityForName:@"Person"
                                       inManagedObjectContext:_context];
        
        for(ABPerson *abPerson in [addressBook people])
        {
            Person *myPerson = [[Person alloc] initWithEntity:entity insertIntoManagedObjectContext:_context];
            
            myPerson.firstName = [abPerson valueForProperty:kABFirstNameProperty];
            myPerson.lastName = [abPerson valueForProperty:kABLastNameProperty];
            
            [self importEmailsFromABPerson: abPerson toMine: myPerson];
            [self importPhonesFromABPerson: abPerson toMine: myPerson];
            [self importAddressesFromABPerson: abPerson toMine: myPerson];
            
            [_context performBlockAndWait:^{
               //if person is valid, save it, otherwise reset the context
                if([myPerson validateForUpdate:NULL] == NO)
                {
                    [_context reset];
                }
                else
                {
                    NSError* error = nil;
                    if([_context save: &error] == NO)
                    {
                        [_context deleteObject:myPerson];
                    }
                }
            }];
        }
    });
}


-(void) importAddressesFromABPerson:(ABPerson*)abPerson toMine:(Person*)myPerson
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MailingAddress" inManagedObjectContext:_context];
    
    ABMultiValue *abAddresses = [abPerson valueForProperty:kABAddressProperty];
    
    for (NSUInteger i = 0, max = [abAddresses count]; i < max; i++) {
        NSString *label = [abAddresses labelAtIndex:i];
        NSString *address = [abAddresses valueAtIndex:i];
        
        if(label == nil || address == nil)
        {
            continue;
        }
        
        MailingAddress *importedAddress = [[MailingAddress alloc] initWithEntity:entity insertIntoManagedObjectContext:_context];
        
        // TODO: unfinished and uncertain
        importedAddress.label = ABLocalizedPropertyOrLabel(label);
        importedAddress.city = [address valueForKey:kABAddressCityKey];
        importedAddress.country = [address valueForKey:kABAddressCountryKey];
        importedAddress.postalCode = [address valueForKey:kABAddressZIPKey];
        importedAddress.street1 = [address valueForKey:kABAddressStreetKey];
        
        importedAddress.person = myPerson;
        
        if([importedAddress validateForUpdate:nil] == NO)
        {
            [_context performBlockAndWait:^{
                [_context deleteObject:importedAddress];
            }];
        }
    }
}

-(void)importPhonesFromABPerson:(ABPerson*)abPerson toMine:(Person*)myPerson
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PhoneNumber" inManagedObjectContext:_context];
    
    ABMultiValue *abPhones = [abPerson valueForProperty:kABPhoneProperty];
    
    for (NSUInteger i = 0, max = [abPhones count]; i < max; i++) {
        NSString *label = [abPhones labelAtIndex:i];
        NSString *phone = [abPhones valueAtIndex:i];
        
        if(label == nil || phone == nil)
        {
            continue;
        }
        
        PhoneNumber *importedPhone = [[PhoneNumber alloc] initWithEntity:entity insertIntoManagedObjectContext:_context];
        
        importedPhone.label = ABLocalizedPropertyOrLabel(label);
        importedPhone.phone = phone;
        
        importedPhone.person = myPerson;
        
        if([importedPhone validateForUpdate:nil] == NO)
        {
            [_context performBlockAndWait:^{
                [_context deleteObject:importedPhone];
            }];
        }
    }
}

-(void) importEmailsFromABPerson:(ABPerson*)abPerson toMine:(Person*)myPerson
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Email" inManagedObjectContext:_context];
    
    ABMultiValue *abEmails = [abPerson valueForProperty:kABEmailProperty];
    
    for (NSUInteger i = 0, max = [abEmails count]; i< max; i++) {
        NSString *label = [abEmails labelAtIndex:i];
        NSString *email = [abEmails valueAtIndex:i];
        
        // skip any weird entries which won't fir with my custom validation
        if(label == nil || email == nil)
        {
            continue;
        }
        
        Email *e = [[Email alloc] initWithEntity:entity insertIntoManagedObjectContext:_context];
        
        e.label = ABLocalizedPropertyOrLabel(label);
        e.email = email;
        //adding the relationship, could be done with method
        e.person = myPerson;
        
        // check if valid
        if([e validateForUpdate:nil] == NO)
        {
            [_context performBlockAndWait:^{
                [_context deleteObject:e];
            }];
        }
    }
}
@end
