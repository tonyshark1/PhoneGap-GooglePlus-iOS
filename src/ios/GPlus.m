//
//  GPlus.m
//
//  Created by Tha Leang on 5/20/14.
//
//

#import "GPlus.h"

@implementation GPlus

- (void)share:(CDVInvokedUrlCommand*)command {
    
    NSString *message   = [command.arguments objectAtIndex:0];
    NSString *urlString = [command.arguments objectAtIndex:1];
    

//    CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"not available"];
//    [self writeJavascript:[pluginResult toErrorCallbackString:command.callbackId]];
//    
//    CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
//    [self writeJavascript:[pluginResult toSuccessCallbackString:command.callbackId]];
}

@end
