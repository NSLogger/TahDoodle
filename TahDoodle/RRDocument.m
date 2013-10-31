//
//  RRDocument.m
//  TahDoodle
//
//  Created by Arun Agrawal on 27/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import "RRDocument.h"

@implementation RRDocument

# pragma NSDocument Overrides

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"RRDocument";
}


# pragma Actions

- (IBAction)createNewItem:(id)sender
{
    if (!todoItems) {
        todoItems = [NSMutableArray array];
    }
    
    [todoItems addObject:@"New Item"];
    
    [itemTableView reloadData];
    
    [self updateChangeCount:NSChangeDone];
}


# pragma Data source methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    return [todoItems count];
}

- (id)tableView:(NSTableView *)tableView
        objectValueForTableColumn:(NSTableColumn *)tableColumn
                    row:(NSInteger)row
{
    return [todoItems objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView
        setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    [todoItems replaceObjectAtIndex:row withObject:object];
    
    [self updateChangeCount:NSChangeDone];
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    if (!todoItems) {
        todoItems = [NSMutableArray array];
    }
    
    NSData *data = [NSPropertyListSerialization
                    dataWithPropertyList:todoItems format:NSPropertyListXMLFormat_v1_0 options:0 error:outError];
    
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    todoItems = [NSPropertyListSerialization
                 propertyListWithData:data options:NSPropertyListMutableContainers format:NULL error:outError];
    
    return (todoItems != nil);
}

@end
