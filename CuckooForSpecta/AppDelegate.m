#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self doSomeWork];
    [self doSomeExtraWork];
    
    return YES;
}

#pragma mark - Private Methods

- (void)doSomeWork
{
    NSLog(@"Doing some work...");
    sleep(5);
    NSLog(@"Finished doing some work...took 5 seconds!!!");
}

- (void)doSomeExtraWork
{
    NSLog(@"Doing some xtra work...");
    sleep(7);
    NSLog(@"Finished doing some xtra work...took 7 seconds!!!");
}

@end
