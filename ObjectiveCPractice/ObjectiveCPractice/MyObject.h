//
//  MyObject.h
//  ObjectiveCPractice
//
//  Created by Georgi Ivanov on 10/28/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyObject : NSObject
{
    int var1;
}

// a class factory method, equivalend to [[MyObject alloc] initWithValue
// :value]
+(id) objectWithValue: (int) value;

//an initializer which takes the initial value
-(id) initWithValue: (int) value;

-(NSString*) Haha;

// property declaration
@property id anotherObject;

@property (nonatomic)int value;

@property (nonatomic, assign, getter = isHidden) BOOL hidden;
@property (weak) id myParent;
@property (nonatomic, copy) NSString* title;
@end
