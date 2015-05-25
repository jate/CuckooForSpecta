#import "CuckooUser.h"
#import <AFNetworking/AFNetworking.h>

@implementation CuckooUser

- (instancetype)initWithHTTPSessionManager:(AFHTTPSessionManager *)httpSessionManager
{
    self = [super init];
    if (self) {
        self.httpSessionManager = httpSessionManager;
        
        [self.httpSessionManager GET:@"/users/1"
                          parameters:nil
                             success:^(NSURLSessionDataTask *task, id responseObject) {
                                 self.name = responseObject[@"name"];
                                 self.username = responseObject[@"username"];
                                 self.email = responseObject[@"email"];
                                 
                                 [[NSNotificationCenter defaultCenter] postNotificationName:@"CuckooUserUpdatedNotification"
                                                                                     object:self];
                             } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                 self.name = @"Peter Parker";
                                 self.username = @"p_parker";
                                 self.email = @"p_parker@amazing.com";
                             }];
    }
    return self;
}

@end

