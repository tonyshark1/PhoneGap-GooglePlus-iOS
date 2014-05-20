//
//  GPlus.m
//
//  Created by Tha Leang on 5/20/14.
//
//

#import "GPlus.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

@interface GPlus() {
    CDVInvokedUrlCommand *cmd;
}

@end

@implementation GPlus

- (void)share:(CDVInvokedUrlCommand*)command {
    cmd = command;
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = YES;
#error Fill in your Google Plus kClientId
    signIn.clientID = @"<#kClientId#>";
    signIn.scopes = @[ kGTLAuthScopePlusLogin ];
    signIn.delegate = self;
    [signIn authenticate];
}

- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error {
    if (error) {
        CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"not available"];
        [self writeJavascript:[pluginResult toErrorCallbackString:cmd.callbackId]];
    } else {
        [self share];
    }
}

- (void) share {
    
    id<GPPNativeShareBuilder> shareBuilder = [[GPPShare sharedInstance] nativeShareDialog];
    // This line will fill out the title, description, and thumbnail from
    // the URL that you are sharing and includes a link to that URL.
    [shareBuilder setURLToShare:[NSURL URLWithString:cmd.arguments[0]]];
    [shareBuilder open];
    
    CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self writeJavascript:[pluginResult toSuccessCallbackString:cmd.callbackId]];
}

@end
