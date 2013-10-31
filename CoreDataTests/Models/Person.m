//
//  Person.m
//  HelloWorld_1
//
//  Created by Georgi Ivanov on 10/29/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import "Person.h"
#import "Email.h"
#import "MailingAddress.h"
#import "PhoneNumber.h"


@implementation Person

@dynamic firstName;
@dynamic lastName;
@dynamic mailingAddress;
@dynamic phoneNumbers;
@dynamic emailAddresses;

-(NSString*) fullName
{
    if(self.firstName != nil && self.lastName != nil)
    {
        return ([NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName]);
    }
    
    if(self.firstName != nil)
    {
        return self.firstName;
    }
    else
    {
        return  self.lastName;
    }
}

-(void) setFullName:(NSString *)fullName
{
    NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSCharacterSet* nonWhitespace = [whitespace invertedSet];
    
    fullName = [fullName stringByTrimmingCharactersInSet:whitespace];
    NSRange r = [fullName rangeOfCharacterFromSet:whitespace];
    
    if(r.location == NSNotFound)
    {
        self.firstName = fullName;
        self.lastName = nil;
        return;
    }
    
    self.firstName = [fullName substringToIndex:r.location];
    r = NSMakeRange(r.location, [fullName length] - r.location);
    r = [fullName rangeOfCharacterFromSet: nonWhitespace options: 0 range: r];
    self.lastName = [ fullName substringFromIndex:r.location];
    
}

+(NSSet *) keyPathsForValuesAffectingFullName
{
    return ([NSSet setWithObjects:@"firstName", @"lastName", nil]);
}
@end
