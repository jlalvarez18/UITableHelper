//
//  TableSectionItem.m
//  Foundwave
//
//  Created by Juan Alvarez on 7/23/14.
//  Copyright (c) 2014 Jowalla. All rights reserved.
//

#import "TableSectionItem.h"

@interface TableSectionItem ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation TableSectionItem

- (instancetype)init
{
    self = [super init];
    
    self.items = [NSMutableArray array];
    
    return self;
}

- (instancetype)initWithHeaderTitle:(NSString *)title
{
    self = [self init];
    
    self.headerTitle = title;
    
    return self;
}

- (void)addRowItemWithCellIdentifier:(NSString *)identifier setup:(void(^)(TableRowItem *rowItem))setup
{
    TableRowItem *rowItem = [TableRowItem new];
    rowItem.cellIdentifier = identifier;
    
    [self.items addObject:rowItem];
    
    setup(rowItem);
}

- (NSArray *)rowItems
{
    return self.items.copy;
}

@end
