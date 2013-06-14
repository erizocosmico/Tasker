//
//  MVAppDelegate.h
//  Tasker
//
//  Created by iMonochrome on 12/06/13.
//  Copyright (c) 2013 mvader.me. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MVAppDelegate : NSObject <NSApplicationDelegate>
{
    NSMutableArray * tasks;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSTextField *textField;

- (IBAction)addTask:(id)sender;

@end
