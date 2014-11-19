//
//  bowlingappTests.m
//  bowlingappTests
//
//  Created by Irene and Simon on 11/17/14.
//  Copyright (c) 2014 Sir Simon and Lady Irene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Game.h"

@interface bowlingappScoringTests : XCTestCase

@end

@implementation bowlingappScoringTests

- (void)testTotalScore {
    NSInteger myTestTotal = 90;

    Game *aGame = [[Game alloc] init];
    [aGame playGame];
    [aGame rollBall:5];
    [aGame rollBall:4];
    [aGame rollBall:6];
    [aGame rollBall:3];
    [aGame rollBall:9];
    [aGame rollBall:0];
    [aGame rollBall:8];
    [aGame rollBall:1];
    [aGame rollBall:9];
    [aGame rollBall:0];
    [aGame rollBall:9];
    [aGame rollBall:0];
    [aGame rollBall:9];
    [aGame rollBall:0];
    [aGame rollBall:9];
    [aGame rollBall:0];
    [aGame rollBall:9];
    [aGame rollBall:0];
    [aGame rollBall:9];
    [aGame rollBall:0];

    XCTAssertEqual([aGame calculateTotal], myTestTotal);
}


@end
