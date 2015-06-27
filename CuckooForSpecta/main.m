@import UIKit;
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Class appDelegateClass = NSClassFromString(@"TestingAppDelegate");
        
        if (!appDelegateClass) {
            appDelegateClass = [AppDelegate class];
        }
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass(appDelegateClass));
    }
}