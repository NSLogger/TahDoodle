//
//  RRDocument.h
//  TahDoodle
//
//  Created by Arun Agrawal on 27/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RRDocument : NSDocument
{
    NSMutableArray *todoItems;
    IBOutlet NSTableView *itemTableView;
    
}

-(IBAction)createNewItem:(id)sender;

@end
