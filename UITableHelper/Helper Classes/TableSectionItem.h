//
//  TableSectionItem.h
//  Foundwave
//
//  Created by Juan Alvarez on 7/23/14.
//  Copyright (c) 2014 Jowalla. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TableRowItem.h"

@interface TableSectionItem : NSObject

@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTitle;

@property (nonatomic, readonly) NSArray *rowItems;

- (instancetype)initWithHeaderTitle:(NSString *)title;

- (void)addRowItemWithCellIdentifier:(NSString *)identifier setup:(void(^)(TableRowItem *rowItem))setup;

@end
