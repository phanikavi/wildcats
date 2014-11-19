//
//  Frame.h
//  bowlingapp
//
//  Created by Irene Cascaron on 11/18/14.
//  Copyright (c) 2014 Hashim Shafique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Frame : NSObject

@property (nonatomic, assign) NSInteger firstBall;
@property (nonatomic, assign) NSInteger secondBall;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign, getter=isScorePending) BOOL scorePending;
@property (nonatomic, assign, getter=isSpare) BOOL spare;
@property (nonatomic, assign, getter=isStrike) BOOL strike;


@end
