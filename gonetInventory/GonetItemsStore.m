//
//  GonetItemsStore.m
//  gonetInventory
//
//  Created by Misael Pérez Chamorro on 5/30/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

#import "GonetItemsStore.h"
#import "GoNetItem.h"

@interface GonetItemsStore ()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation GonetItemsStore

+ (instancetype)sharedStore
{
  static GonetItemsStore *sharedStore;
  // Do I need to create a sharedStore?
  if (!sharedStore) {
    sharedStore = [[self alloc] initPrivate];
  }
  return sharedStore;
}

- (instancetype)initPrivate
{
  self = [super init];
  if (self) {
    _privateItems = [[NSMutableArray alloc] init];
  }
  return self;
}

- (NSArray *)allItems
{
  return [self.privateItems copy];
}

- (GoNetItem *)createItem
{
  GoNetItem *item = [[GoNetItem alloc] initWithItemName:@"PS4 PRO"];
  [self.privateItems addObject:item];
  return item;
}

- (instancetype)init
{
  [NSException raise:@"Singleton"
              format:@"Use +[GonetItemStore sharedStore]"];
  return nil;
}

@end
