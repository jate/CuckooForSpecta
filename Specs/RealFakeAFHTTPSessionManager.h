#import "AFHTTPSessionManager.h"

@interface RealFakeAFHTTPSessionManager : AFHTTPSessionManager

@property (copy, nonatomic) NSString *getURLString;
@property (strong, nonatomic) NSDictionary *getParameters;
@property (copy, nonatomic) void (^getSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
@property (copy, nonatomic) void (^getFailureBlock)(NSURLSessionDataTask *task, NSError *error);

@end
