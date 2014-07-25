//
//  TableFormItem.m
//  Foundwave
//
//  Created by Juan Alvarez on 7/23/14.
//  Copyright (c) 2014 Jowalla. All rights reserved.
//

#import "TableFormItem.h"

@interface TableFormItem ()

@property (nonatomic, strong) NSMutableArray *sectionItems;

@property (nonatomic, strong) NSMutableDictionary *cellsSetupInfo;

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation TableFormItem

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    
    self.sectionItems = [NSMutableArray array];
    self.cellsSetupInfo = [NSMutableDictionary dictionary];
    self.tableView = tableView;
    
    return self;
}

- (TableSectionItem *)addSectionItem
{
    TableSectionItem *sectionItem = [TableSectionItem new];
    
    [self.sectionItems addObject:sectionItem];
    
    return sectionItem;
}

- (NSInteger)sectionItemCount
{
    return self.sectionItems.count;
}

- (TableSectionItem *)sectionItemAtIndex:(NSInteger)index
{
    TableSectionItem *sectionItem = self.sectionItems[index];
    
    return sectionItem;
}

- (TableRowItem *)rowItemAtIndexPath:(NSIndexPath *)indexPath
{
    TableSectionItem *sectionItem = [self sectionItemAtIndex:indexPath.section];
    TableRowItem *rowItem = sectionItem.rowItems[indexPath.row];
    
    return rowItem;
}

- (void)registerCellClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier withCellSetup:(RowCellSetupBlock)setupBlock
{
    [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
    
    NSDictionary *cellInfo = @{@"class": cellClass, @"id": identifier, @"setup": setupBlock};
    
    self.cellsSetupInfo[identifier] = cellInfo;
}

- (UITableViewCell *)setupRowItemCellAtIndexPath:(NSIndexPath *)indexPath
{
    TableSectionItem *sectionItem = self.sectionItems[indexPath.section];
    TableRowItem *rowItem = sectionItem.rowItems[indexPath.row];
    
    NSString *cellIdentifier = rowItem.cellIdentifier;
    
    NSDictionary *cellInfo = self.cellsSetupInfo[cellIdentifier];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    RowCellSetupBlock setupBlock = cellInfo[@"setup"];
    
    setupBlock(rowItem.representedObject, cell);
    
    return cell;
}

#pragma mark -
#pragma mark Accessor Methods

- (NSArray *)items
{
    return self.sectionItems.copy;
}

@end
