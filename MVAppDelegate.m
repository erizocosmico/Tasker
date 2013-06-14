//
//  MVAppDelegate.m
//  Tasker
//
//  Created by iMonochrome on 12/06/13.
//  Copyright (c) 2013 mvader.me. All rights reserved.
//

#import "MVAppDelegate.h"

@implementation MVAppDelegate

@synthesize tableView;
@synthesize textField;

- (id)init
{
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *filePath = [documentsDirectory stringByAppendingString:@"/tasks.dat"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            NSDictionary * loadDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
            tasks = [loadDict valueForKey:@"tasks"];
        } else {
            tasks = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    return (NSInteger) [tasks count];
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString * task = [tasks objectAtIndex:row];
    return task;
}

-(void)saveTasks
{
    NSMutableDictionary * saveDict = [NSMutableDictionary dictionaryWithCapacity:[tasks count]];
    [saveDict setValue:tasks forKey:@"tasks"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingString:@"/tasks.dat"];
    [saveDict writeToFile:filePath atomically:YES];
}

- (IBAction)addTask:(id)sender
{
    NSString * task = [textField stringValue];
    if ([task length] > 0) {
        [tasks addObject:task];
        [tableView reloadData];
        [textField setStringValue:@""];
        [self saveTasks];
    }
}

- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    if ([anObject length] == 0) {
        [tasks removeObjectAtIndex:rowIndex];
    } else {
        [tasks replaceObjectAtIndex:rowIndex withObject:anObject];
    }
    [self saveTasks];
    [tableView reloadData];
}

@end
