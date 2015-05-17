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
});

SpecEnd