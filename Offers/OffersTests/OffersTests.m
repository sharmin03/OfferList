//
//  OffersTests.m
//  OffersTests
//
//  Created by Sharmin Khan on 10.10.20.
//

#import <XCTest/XCTest.h>
#import "NetworkManager.h"
#import "OffersViewController.h"

@interface OffersTests : XCTestCase
@property NetworkManager *nw;
@property OffersViewController *ofVC;
@end

@implementation OffersTests

- (void)setUp {
    _nw = [[NetworkManager alloc] init];
    _ofVC = [[OffersViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testIpAddress {
    XCTAssertEqualObjects(_nw.ip, @"&ip=109.235.143.113", @"IP is not correct");
}

- (void)testBaseUrl {
    XCTAssertEqualObjects(_nw.baseUrl, @"https://api.fyber.com/feed/v1/offers.json?", @"Base Url is not correct");
}

- (void)testTableViewPropertySetAfterLoading {
    XCTAssert(_ofVC.tableView.delegate != nil, "TableView delegate should not be nil");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
