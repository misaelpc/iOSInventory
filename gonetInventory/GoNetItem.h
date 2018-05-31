//
//  GoNetItem.h
//  gonetInventory
//
//  Created by Misael Pérez Chamorro on 5/30/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoNetItem : NSObject

@property (nonatomic, strong) NSString * itemName;
@property (nonatomic, strong) NSString * serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, strong) NSDate * dateCreated;

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;


@end
