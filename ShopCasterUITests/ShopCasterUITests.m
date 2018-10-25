//
//  ShopCasterUITests.m
//  ShopCasterUITests
//
//  Created by Lance T. Walker on 7/24/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ShopCasterUITests : XCTestCase

@end

@implementation ShopCasterUITests
- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void) tearDown {
    [super tearDown];
}

- (void)testExample {

}
@end
