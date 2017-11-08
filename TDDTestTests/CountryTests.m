//
//  TopicTests.m
//  TDDTest
//
//  Created by Syed Fakhir on 10/30/17.
//  Copyright © 2017 PWC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Country.h"
#import "ViewController.h"

@interface CountryTests : XCTestCase

@end

@implementation CountryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCountryAttributes {
    NSString *name = @"Australia";
    
    Country *country = [[Country alloc] initWithName:name];
    
    XCTAssertEqualObjects(name, country.name);
}

- (void)testCountryDataSetup {
    NSArray<Country *> *countries = @[
                                      [[Country alloc] initWithName:@"Albania"],
                                      [[Country alloc] initWithName:@"Bangladesh"],
                                      [[Country alloc] initWithName:@"Canada"]
                                      ];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navCon = [storyboard instantiateInitialViewController];
    ViewController *viewCon = (ViewController *)[navCon topViewController];
    [viewCon.view layoutIfNeeded];
    
    viewCon.countries = countries;
    [viewCon.countriesTableView reloadData];
    
    XCTAssertEqual([countries count], [viewCon.countriesTableView numberOfRowsInSection:0]);
}

- (void)testCountryEntryInArray {
    Country *country = [[Country alloc] initWithName:@"France"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navCon = [storyboard instantiateInitialViewController];
    ViewController *viewCon = (ViewController *)[navCon topViewController];
    [viewCon.view layoutIfNeeded];
    
    viewCon.countries = [viewCon.countries arrayByAddingObject:country];
    
    XCTAssertEqualObjects(country, [viewCon.countries lastObject]);
}

- (void)testCountryNameInNewEntry {
    Country *country = [[Country alloc] initWithName:@"France"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navCon = [storyboard instantiateInitialViewController];
    ViewController *viewCon = (ViewController *)[navCon topViewController];
    [viewCon.view layoutIfNeeded];
    
    [viewCon.countryTextField setText:[country name]];
    
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [[viewCon.addCountryButton target] performSelector:[viewCon.addCountryButton action] withObject:viewCon.addCountryButton];
    
    XCTAssertEqualObjects([[viewCon.countries lastObject] name], [country name]);
}

@end
