GooglePlus-PhoneGap-iOS
=======================

Phonegap plugin to allow users to share with Google+ (SDK v1.7.1)

### Installation

- `phonegap plugin add https://github.com/vleango/GooglePlus-PhoneGap-iOS.git`
- In `AppDelegate.m`, import header `#import <GooglePlus/GooglePlus.h>`
- Add:
```
- (BOOL)application: (UIApplication *)application
            openURL: (NSURL *)url
  sourceApplication: (NSString *)sourceApplication
         annotation: (id)annotation {
 return [GPPURLHandler handleURL:url
               sourceApplication:sourceApplication
                      annotation:annotation];
}
```
- Targets -> Info -> URL Types
```
identifier: your.bundle.id
URL Schemes: your.bundle.id
```

- In `GPlus.m`, add your `clientId`

### Usage
`window.plugins.gplus.share(url, successCallback, errorCallback);`
