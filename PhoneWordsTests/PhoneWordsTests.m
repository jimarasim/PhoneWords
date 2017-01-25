//
//  PhoneWordsTests.m
//  PhoneWordsTests
//
//  Created by JAMES K ARASIM on 1/25/17.
//  Copyright © 2017 JAMES K ARASIM. All rights reserved.
//
//  THIS TEST CLASS DEMONSTRATES HOW TO UNIT TEST A VIEW CONTROLLER

#import <XCTest/XCTest.h>

//INCLUDE THE VIEW CONTROLLERS HEADER FILE. THE DEFAULT SEARCH PATH WILL FIND IT IN THIS PROJECTS HEADER FILES
#import "PhoneWordsViewController.h"

@interface PhoneWordsTests : XCTestCase
//CREATE A PROPERTY FOR THE VIEW CONTROLLER CLASS TO TEST
@property (nonatomic) PhoneWordsViewController *vcToTest;
@end

@implementation PhoneWordsTests

- (void)setUp {
    [super setUp];
    
    //ALLOCATE AND INITIALIZE THE VIEW CONTROLLER CLASS FOR TESTING
    self.vcToTest = [[PhoneWordsViewController alloc] init];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//THIS TEST ASSERTS THE NUMBER OF COLUMNS RETURNED BY THE PICKER VIEW DELEGATE, IN THE VIEWCONTROLLER UNDER TEST, ALWAYS RETURNS 3
- (void)testNumberOfColumns{
    NSInteger result = [self.vcToTest numberOfComponentsInPickerView:self.vcToTest.phoneWordsPicker];
    
    XCTAssert(result==3);
}



- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
