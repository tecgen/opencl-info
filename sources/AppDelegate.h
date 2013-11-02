//
//  AppDelegate.h
//  OpenCLTest
//
//  Created by Marco Pehla on 08.09.13.
//  Copyright (c) 2013 tecgen.de. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BusinessLogic.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textArea;
@property (weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (weak) IBOutlet NSView *viewTwoDimensional;

@property (strong) BusinessLogic *businessLogic;


- (IBAction)buttonStartClicked:(id)sender;

@end
