//
//  GPlus.m
//
//  Created by Tha Leang on 5/20/14.
//
//

#import "GPlus.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

@interface GPlus()<GPPShareDelegate> {
    CDVInvokedUrlCommand *cmd;
}

@end

@implementation GPlus

- (void)share:(CDVInvokedUrlCommand*)command {
    cmd = command;
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = YES;
    signIn.clientID = @"1081700471293-7ki91t72sbsk9hkrj77ql8659uiqu9tq.apps.googleusercontent.com";
    signIn.scopes = @[ kGTLAuthScopePlusLogin ];
    signIn.delegate = self;
    [signIn authenticate];
}

- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error {
    if (error) {
        CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"not available"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:cmd.callbackId];
      
    } else {
        [self share];
    }
}

- (void) share {
    
    id<GPPNativeShareBuilder> shareBuilder = [[GPPShare sharedInstance] nativeShareDialog];
    
    [[GPPShare sharedInstance] setDelegate:self];
    
    // This line will fill out the title, description, and thumbnail from
    // the URL that you are sharing and includes a link to that URL.
    [shareBuilder setURLToShare:[NSURL URLWithString:cmd.arguments[0]]];
    [shareBuilder open];
}

- (void)finishedSharingWithError:(NSError *)error {
    
    if (error) {
        CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:NO];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:cmd.callbackId];
    }
    else {
        CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:cmd.callbackId];
    }
}

@end
