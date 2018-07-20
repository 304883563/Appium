/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <XCTest/XCTest.h>

#import "FBApplication.h"
#import "FBIntegrationTestCase.h"
#import "FBTestMacros.h"
#import "FBSpringboardApplication.h"
#import "XCUIApplication+FBHelpers.h"
#import "XCUIElement+FBIsVisible.h"

@interface XCUIApplicationHelperTests : FBIntegrationTestCase
@end

@implementation XCUIApplicationHelperTests

- (void)setUp
{
  [super setUp];
  [self launchApplication];
}

- (void)testQueringSpringboard
{
  [self goToSpringBoardFirstPage];
  XCTAssertTrue([FBSpringboardApplication fb_springboard].icons[@"Safari"].exists);
  XCTAssertTrue([FBSpringboardApplication fb_springboard].icons[@"Calendar"].exists);
}

- (void)testTappingAppOnSpringboard
{
  [self goToSpringBoardFirstPage];
  NSError *error;
  XCTAssertTrue([[FBSpringboardApplication fb_springboard] fb_tapApplicationWithIdentifier:@"Safari" error:&error]);
  XCTAssertNil(error);
  XCTAssertTrue([FBApplication fb_activeApplication].buttons[@"URL"].exists);
}

- (void)disabled_testWaitingForSpringboard
{
  // This test is flaky on Travis
  NSError *error;
  [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
  XCTAssertTrue([[FBSpringboardApplication fb_springboard] fb_waitUntilApplicationBoardIsVisible:&error]);
  XCTAssertNil(error);
  XCTAssertTrue([FBSpringboardApplication fb_springboard].icons[@"Safari"].fb_isVisible);
}

- (void)testApplicationTree
{
  [self.testedApplication query];
  [self.testedApplication resolve];
  XCTAssertNotNil(self.testedApplication.fb_tree);
  XCTAssertNotNil(self.testedApplication.fb_accessibilityTree);
}

- (void)disabled_testDeactivateApplication
{
  // This test randomly causes:
  // Failure fetching attributes for element <XCAccessibilityElement: 0x6080008407b0> Device element: Error Domain=XCTDaemonErrorDomain Code=13 "Value for attribute 5017 is an error." UserInfo={NSLocalizedDescription=Value for attribute 5017 is an error.}
  [self.testedApplication query];
  [self.testedApplication resolve];
  NSError *error;
  XCTAssertTrue([self.testedApplication fb_deactivateWithDuration:1 error:&error]);
  XCTAssertNil(error);
  XCTAssertTrue(self.testedApplication.buttons[@"Alerts"].exists);
  FBAssertWaitTillBecomesTrue(self.testedApplication.buttons[@"Alerts"].fb_isVisible);
}

- (void)testActiveApplication
{
  XCTAssertTrue([FBApplication fb_activeApplication].buttons[@"Alerts"].fb_isVisible);
  [self goToSpringBoardFirstPage];
  XCTAssertTrue([FBApplication fb_activeApplication].icons[@"Safari"].fb_isVisible);
}

@end
