//
//  TableRowItem.h
//  Foundwave
//
//  Created by Juan Alvarez on 7/23/14.
//  Copyright (c) 2014 Jowalla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableRowItem : NSObject

@property (nonatomic, strong) id representedObject;
@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, copy) void(^action)(void);

@end
