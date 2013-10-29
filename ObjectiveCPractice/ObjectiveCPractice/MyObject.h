//
//  MyObject.h
//  ObjectiveCPractice
//
//  Created by Georgi Ivanov on 10/28/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DataSource
@required
-(NSString*)getData;
@optional
-(NSInteger) getNumber;
@end

@interface MyObject : NSObject <DataSource>
{
    int var1;
}

// a class factory method, equivalend to [[MyObject alloc] initWithValue
// :value]
+(id) objectWithValue: (int) value;

//an initializer which takes the initial value
-(id) initWithValue: (int) value;

-(NSString*) Haha;
-(void)startTaskInBackground;
@property (weak) NSButton *btnButton;
// property declaration
@property id anotherObject;

@property (nonatomic)int value;

@property (nonatomic, assign, getter = isHidden) BOOL hidden;
@property (weak) id myParent;
@property (nonatomic, copy) NSString* title;
@end
