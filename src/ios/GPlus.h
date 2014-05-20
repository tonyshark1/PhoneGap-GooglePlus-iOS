//
//  GPlus.h
//
//  Created by Tha Leang on 5/20/14.
//
//

#import <Cordova/CDV.h>
#import <GooglePlus/GooglePlus.h>

@interface GPlus : CDVPlugin <GPPSignInDelegate>

- (void)share:(CDVInvokedUrlCommand*)command;


@end