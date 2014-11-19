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
    [aGame rollBall:5 completion:^(BOOL reset){}];
    [aGame rollBall:4 completion:^(BOOL reset){}];
    [aGame rollBall:6 completion:^(BOOL reset){}];
    [aGame rollBall:3 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:8 completion:^(BOOL reset){}];
    [aGame rollBall:1 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];

    XCTAssertEqual([aGame calculateTotal], myTestTotal);
}

- (void)testTotalScoreWithSpare {
    NSInteger myTestTotal = 99;
    
    Game *aGame = [[Game alloc] init];
    [aGame playGame];
    [aGame rollBall:5 completion:^(BOOL reset){}];
    [aGame rollBall:4 completion:^(BOOL reset){}];
    [aGame rollBall:6 completion:^(BOOL reset){}];
    [aGame rollBall:3 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:1 completion:^(BOOL reset){}];
    [aGame rollBall:8 completion:^(BOOL reset){}];
    [aGame rollBall:1 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    
    XCTAssertEqual([aGame calculateTotal], myTestTotal);
}

- (void)testTotalScoreWithStrike {
    NSInteger myTestTotal = 100;
    
    Game *aGame = [[Game alloc] init];
    [aGame playGame];
    [aGame rollBall:10 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:6 completion:^(BOOL reset){}];
    [aGame rollBall:3 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:8 completion:^(BOOL reset){}];
    [aGame rollBall:1 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    [aGame rollBall:9 completion:^(BOOL reset){}];
    [aGame rollBall:0 completion:^(BOOL reset){}];
    
    XCTAssertEqual([aGame calculateTotal], myTestTotal);
}

@end
