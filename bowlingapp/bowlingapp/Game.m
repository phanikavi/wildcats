//
//  Game.m
//  bowlingapp
//
//  Created by Irene Cascaron on 11/18/14.
//  Copyright (c) 2014 Hashim Shafique. All rights reserved.
//

#import "Game.h"
#import "Frame.h"

@interface Game()

@property (nonatomic, strong) NSMutableArray *frames;
@property (nonatomic, assign) NSInteger totalScore;

@end

@implementation Game

- (id) init
{
    if (self = [super init]) {
        _totalScore = 0;
    }
    return self;
}

- (void) playGame
{
    if (!self.frames) {
        self.frames = [[NSMutableArray alloc] init];
    }
    Frame *newFrame = [[Frame alloc] init];
    [self.frames addObject:newFrame];
}

- (NSInteger)calculateTotal
{
    Frame *lastFrame = [self.frames lastObject];
    self.totalScore = lastFrame.score;
    return self.totalScore;
}

- (void)setFrameScore:(NSInteger)score inFrame:(NSInteger)inFrame
{
    Frame *frameToUpdate = [self.frames objectAtIndex:inFrame];
    frameToUpdate.score = score;

}

- (void)rollBall:(NSInteger)pins completion:(void (^)(BOOL *resetPins))completion
{
    Frame *frameToPlay = [self.frames lastObject];
    if (frameToPlay.firstBall < 0) {
        frameToPlay.firstBall = pins;

        if (pins == 10) {
            //tell ui to put pins up
            //tel ui to draw strike on second ball square?
            frameToPlay.strike = YES;
            frameToPlay.scorePending = YES;
        }

    } else {
        frameToPlay.secondBall = pins;
        if ((frameToPlay.firstBall + frameToPlay.secondBall) == 10) {
            frameToPlay.spare = YES;
            frameToPlay.scorePending = YES;
        } else {
            // add previous + firstball + secondball
            //[self setFrameScore:(frameToPlay.firstBall + frameToPlay.secondBall) inFrame:[self.frames indexOfObject:frameToPlay]];
        }

    }



    if (self.frames.count > 1) {
        Frame *previousFrame = [self.frames objectAtIndex:([self.frames indexOfObject:[self.frames lastObject]]-1)];

    }
    Frame *newFrame = [[Frame alloc] init];
    [self.frames addObject:newFrame];




}

- (void) writeScoreInFrames:(Frame *)inProgressFrame
{
    if (self.frames.count == 1) {
        if (![inProgressFrame isScorePending]) {
            [self setFrameScore:(inProgressFrame.firstBall + inProgressFrame.secondBall) inFrame:[self.frames indexOfObject:inProgressFrame]];
        }
    }

}


@end
