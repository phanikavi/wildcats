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
@property (nonatomic, assign, getter=isStrikePending) BOOL strikePending;
@property (nonatomic, assign, getter=isTwoStrikePending) BOOL twoStrikePending;
@property (nonatomic, assign, getter=isSparePending) BOOL sparePending;

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

- (void)rollBall:(NSInteger)pins
{
    Frame *frameToPlay = [self.frames lastObject];
    if (frameToPlay.firstBall < 0) {
        frameToPlay.firstBall = pins;

        // tell ui something, keep going?
        if ([self isSparePending]) {
            //go back one and score frame
            self.sparePending = NO;
        } else if ([self isTwoStrikePending]) {
            // go back and score two frames back
            self.twoStrikePending = NO;
            self.strikePending = YES;
        }
        if (pins == 10) {
            //tell ui to put pins up
            //tel ui to draw strike on second ball square?
            Frame *newFrame = [[Frame alloc] init];
            [self.frames addObject:newFrame];
            if ([self isStrikePending]) {
                self.twoStrikePending = YES;
            } else {
                self.strikePending = YES;
            }
        }
        
        return;
    } else {
        frameToPlay.secondBall = pins;
        if ((frameToPlay.firstBall + frameToPlay.secondBall) == 10) {
            //tell ui spare?
            self.sparePending = YES;
        } else {
            [self setFrameScore:(frameToPlay.firstBall + frameToPlay.secondBall) inFrame:[self.frames indexOfObject:frameToPlay]];
        }
        // Frame *newFrame = [[Frame alloc] init];
        // [self.frames addObject:newFrame];
    }


}


@end
