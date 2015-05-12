#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>

SpecBegin(Thing)

describe(@"Thing", ^{
    it(@"s yes", ^{
        expect(YES).to.beTruthy();
    });
    
    it(@"s no", ^{
        expect(NO).to.beTruthy();
    });
});

SpecEnd