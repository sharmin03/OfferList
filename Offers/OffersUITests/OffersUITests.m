//
//  OffersUITests.m
//  OffersUITests
//
//  Created by Sharmin Khan on 10.10.20.
//

#import <XCTest/XCTest.h>

@interface OffersUITests : XCTestCase

@end

@implementation OffersUITests

XCUIApplication *app;

- (void)setUp {
    self.continueAfterFailure = NO;

    app = [[XCUIApplication alloc] init];
    [app launch];
}

- (void)tearDown {
    
}

- (void)testUserForm {
    
    [[[[[[[[[[[app.windows childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeTextField].element tap];
    
    
    
    XCUIElement *element2 = [[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *element = [element2 childrenMatchingType:XCUIElementTypeOther].element;
    [[[[element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeTextField].element tap];
    
    [[[[element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:2] childrenMatchingType:XCUIElementTypeTextField].element tap];

    [element2 tap];
    [app/*@START_MENU_TOKEN@*/.staticTexts[@"Get Offers"]/*[[".buttons[@\"Get Offers\"].staticTexts[@\"Get Offers\"]",".staticTexts[@\"Get Offers\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    
    XCUIElement *starzplayOriginalSeriesMoviesStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts[@"STARZPLAY Original Series + Movies"]/*[[".cells.staticTexts[@\"STARZPLAY Original Series + Movies\"]",".staticTexts[@\"STARZPLAY Original Series + Movies\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [starzplayOriginalSeriesMoviesStaticText tap];
    [starzplayOriginalSeriesMoviesStaticText swipeDown];
    
}


- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
