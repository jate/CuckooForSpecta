#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "CuckooUser.h"
#import <AFNetworking/AFNetworking.h>
#import "RealFakeAFHTTPSessionManager.h"

SpecBegin(CuckooUserSpec)

describe(@"CuckooUser", ^{
    __block CuckooUser *cuckooUser;
    __block RealFakeAFHTTPSessionManager *fakeHttpSessionManager;
    
    beforeEach(^{
        fakeHttpSessionManager = [[RealFakeAFHTTPSessionManager alloc] init];
        cuckooUser = [[CuckooUser alloc] initWithHTTPSessionManager:fakeHttpSessionManager];
    });
    
    it(@"exists", ^{
        expect(cuckooUser).toNot.beNil();
    });
    
    it(@"has a name", ^{
        cuckooUser.name = @"Rocket";
        expect(cuckooUser.name).to.equal(@"Rocket");
    });
    
    it(@"has a username", ^{
        cuckooUser.username = @"rocketRaccoon";
        expect(cuckooUser.username).to.equal(@"rocketRaccoon");
    });
    
    it(@"has an email", ^{
        cuckooUser.email = @"rocketRaccoon@guardiansOfTheGalaxy.com";
        expect(cuckooUser.email).to.equal(@"rocketRaccoon@guardiansOfTheGalaxy.com");
    });
    
    it(@"has an AFHTTPSessionManager", ^{
        expect(cuckooUser.httpSessionManager).toNot.beNil();
    });
    
    it(@"hits the /users/1 endpoint for user JSON", ^{
        expect(fakeHttpSessionManager.getURLString).to.equal(@"/users/1");
        expect(fakeHttpSessionManager.getParameters).to.beNil();
    });
    
    context(@"on success", ^{
        __block NSDictionary *fakeResponse;
        __block id fakeNSNotificationCenter;
        
        beforeEach(^{
            fakeNSNotificationCenter = OCMClassMock([NSNotificationCenter class]);
            OCMStub([fakeNSNotificationCenter defaultCenter]).andReturn(fakeNSNotificationCenter);
            
            fakeResponse = @{ @"name":     @"Sam Rockwell",
                              @"username": @"vMancini",
                              @"email":    @"vMancini@moon.com" };
            
            if (fakeHttpSessionManager.getSuccessBlock) {
                fakeHttpSessionManager.getSuccessBlock(nil, fakeResponse);
            }
        });
        
        it(@"sets the name", ^{
            expect(cuckooUser.name).to.equal(@"Sam Rockwell");
        });
        
        it(@"sets the username", ^{
            expect(cuckooUser.username).to.equal(@"vMancini");
        });
        
        it(@"sets the email", ^{
            expect(cuckooUser.email).to.equal(@"vMancini@moon.com");
        });
        
        it(@"it posts a CuckooUserUpdatedNotification", ^{
            OCMVerify([fakeNSNotificationCenter postNotificationName:@"CuckooUserUpdatedNotification"
                                                              object:cuckooUser]);
        });
    });
    
    context(@"on failure", ^{
        beforeEach(^{
            if (fakeHttpSessionManager.getFailureBlock) {
                fakeHttpSessionManager.getFailureBlock(nil,nil);
            }
        });
        
        it(@"sets default user values", ^{
            expect(cuckooUser.name).to.equal(@"Peter Parker");
            expect(cuckooUser.username).to.equal(@"p_parker");
            expect(cuckooUser.email).to.equal(@"p_parker@amazing.com");
        });
    });
});

SpecEnd