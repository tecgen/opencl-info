//
//  AppDelegate.m
//  OpenCLTest
//
//  Created by Marco Pehla on 08.09.13.
//  Copyright (c) 2013 tecgen.de. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

NSString *application = @"OpenCL Information";

// constructor 
- (id) init {
    if (nil != (self = [super init]))
    {
        NSLog (@"init: text %@", _textArea);
    }
    
    
    return self;
}

- (void)awakeFromNib
{
    NSLog (@"awake: text %@", _textArea);
    //[_textArea setStringValue:application];
    
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
}

// connected to button via GUI (ctrl+click)
- (IBAction)buttonStartClicked:(id)sender
{
    [_progressIndicator startAnimation:self];
    // sleep 2 sec.
    [NSThread sleepForTimeInterval:2];
    //Java: _businessLogic = new BusinessLogic();
    _businessLogic = [[BusinessLogic alloc] init];
    NSString *value = [[_textArea stringValue] stringByAppendingString:@" started...\n"];
    
    value = [value stringByAppendingString:[_businessLogic execute]];
    
    [_textArea setStringValue:value];
    
    [_progressIndicator stopAnimation:self];
}
@end
