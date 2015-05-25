#import "RealFakeAFHTTPSessionManager.h"

@implementation RealFakeAFHTTPSessionManager

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    self.getURLString = URLString;
    self.getParameters = parameters;
    self.getSuccessBlock = success;
    self.getFailureBlock = failure;
    
    return nil;
}

@end
