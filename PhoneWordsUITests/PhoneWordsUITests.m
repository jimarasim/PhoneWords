//
//  PhoneWordsUITests.m
//  PhoneWordsUITests
//
//  Created by JAMES K ARASIM on 1/25/17.
//  Copyright © 2017 JAMES K ARASIM. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PhoneWordsUITests : XCTestCase

@end

@implementation PhoneWordsUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    //TEST: TAP PLEASE ENTER 10 DIGITS LABEL
    [[[XCUIApplication alloc] init].otherElements[@"Please enter 10 digits"] tap];
    
    
}
    
- (void) testEnterNumberThenClear{
        
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *textField = app.textFields[@"10 Digit Phone Number"];
    [textField tap];
    [textField typeText:@"2063727265"];
    
    XCUIElement *a0mPickerWheel = app.pickerWheels[@"a0m"];
    [a0mPickerWheel swipeUp];
    [app.pickerWheels[@"dpa"] swipeUp];
    [app.pickerWheels[@"pamj"] swipeUp];
    [app.buttons[@"Clear text"] tap];

}

@end
