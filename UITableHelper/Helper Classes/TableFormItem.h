//
//  TableFormItem.h
//  Foundwave
//
//  Created by Juan Alvarez on 7/23/14.
//  Copyright (c) 2014 Jowalla. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TableSectionItem.h"

typedef void(^RowCellSetupBlock)(id representedObject, UITableViewCell *cell);

@interface TableFormItem : NSObject

@property (nonatomic, readonly) NSArray *items;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (TableSectionItem *)addSectionItem;

- (NSInteger)sectionItemCount;
- (TableSectionItem *)sectionItemAtIndex:(NSInteger)index;
- (TableRowItem *)rowItemAtIndexPath:(NSIndexPath *)indexPath;

- (void)registerCellClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier withCellSetup:(RowCellSetupBlock)setupBlock;

- (UITableViewCell *)setupRowItemCellAtIndexPath:(NSIndexPath *)indexPath;

@end
