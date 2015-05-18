#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "CuckooUser.h"

SpecBegin(CuckooUserSpec)

describe(@"CuckooUser", ^{
    __block CuckooUser *cuckooUser;
    
    beforeEach(^{
        cuckooUser = [[CuckooUser alloc] init];
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
});

SpecEnd