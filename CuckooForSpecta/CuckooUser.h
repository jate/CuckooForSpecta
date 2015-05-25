#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface CuckooUser : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *email;
@property (strong, nonatomic) AFHTTPSessionManager *httpSessionManager;

- (instancetype)initWithHTTPSessionManager:(AFHTTPSessionManager *)httpSessionManager;

@end
