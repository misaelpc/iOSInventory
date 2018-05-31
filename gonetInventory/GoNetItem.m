//
//  GoNetItem.m
//  gonetInventory
//
//  Created by Misael Pérez Chamorro on 5/30/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

#import "GoNetItem.h"

@implementation GoNetItem

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
  // Call the superclass's designated initializer
  self = [super init];
  // Did the superclass's designated initializer succeed?
  if (self) {
    // Give the instance variables initial values
    _itemName = name;
    _serialNumber = sNumber;
    _valueInDollars = value;
    // Set _dateCreated to the current date and time
    _dateCreated = [[NSDate alloc] init];
  }
  return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
  return [self initWithItemName:name
                 valueInDollars:0
                   serialNumber:@""];
}

- (instancetype)init
{
  return [self initWithItemName:@"Item"];
}



@end
