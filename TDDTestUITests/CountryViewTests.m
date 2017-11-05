//
//  CountryViewTests.m
//  CountryViewTests
//
//  Created by Syed Fakhir on 11/05/17.
//  Copyright © 2017 PWC. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CountryViewTests : XCTestCase

@end

@implementation CountryViewTests

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

//- (void)testExample {
//    // Use recording to get started writing UI tests.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//}

- (void)testCountryEntry {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *countryNameTextField = app.tables.textFields[@"Country Name"];
    [countryNameTextField tap];
    
    NSString *countryName = @"France";
    [countryNameTextField typeText:countryName];
    
    [app.navigationBars[@"Countries"].buttons[@"Add"] tap];
    
    XCUIElement *table = [app.tables element];
    XCTAssertTrue(table.exists);
    
    XCUIElement *cell = [table.cells elementBoundByIndex:0];
    XCTAssertTrue(cell.exists);
    XCTAssertEqualObjects([[cell.staticTexts element] label], countryName);
    
    XCUIElement *indexedText = [cell.staticTexts element];
    XCTAssertTrue(indexedText.exists);
}

@end
