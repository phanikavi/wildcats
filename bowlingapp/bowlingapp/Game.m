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
/*<
    UIAlertViewDelegate
>*/

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

- (void)rollBall:(NSInteger)pins completion:(void (^)(BOOL resetPins))completion
{
    Frame *frameToPlay = [self.frames lastObject];
    if (frameToPlay.firstBall < 0) {
        frameToPlay.firstBall = pins;

        if (pins == 10) {
            frameToPlay.strike = YES;
            frameToPlay.scorePending = YES;
            if (completion) completion(YES);
        } else {
            frameToPlay.scorePending = YES;
        }
        if (completion) completion(NO);

    } else {
        frameToPlay.secondBall = pins;
        if ((frameToPlay.firstBall + frameToPlay.secondBall) == 10) {
            frameToPlay.spare = YES;
            frameToPlay.scorePending = YES;
        } else {
            frameToPlay.scorePending = NO;
        }
        if (completion) completion(YES);
    }
    [self writeScoreInFrames:frameToPlay];

   /* dispatch_async(dispatch_get_main_queue(), ^{

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WeBowler"
                                                            message:@""
                                                           delegate:self
                                                  otherButtonTitles:NSLocalizedString(@"res_OK", nil), nil];
        [alertView show];
    });*/
}

- (void) getNewFrame
{
    Frame *newFrame = [[Frame alloc] init];
    [self.frames addObject:newFrame];
}

- (Frame *) getPreviousFrame:(Frame *)frame
{
    return [self.frames objectAtIndex:([self.frames indexOfObject:[self.frames lastObject]]-1)];

}

- (Frame *) get2PreviousFrame:(Frame *)frame
{
    return [self.frames objectAtIndex:([self.frames indexOfObject:[self.frames lastObject]]-2)];

}

- (Frame *) get3PreviousFrame:(Frame *)frame
{
    return [self.frames objectAtIndex:([self.frames indexOfObject:[self.frames lastObject]]-3)];

}


- (void) writeScoreInFrames:(Frame *)inProgressFrame
{
    if (self.frames.count == 1) {
        if (![inProgressFrame isScorePending]) {
            [self setFrameScore:(inProgressFrame.firstBall + inProgressFrame.secondBall) inFrame:[self.frames indexOfObject:inProgressFrame]];
            [self getNewFrame];
        }
        return;
    }
    Frame *prevFrame = [self getPreviousFrame:inProgressFrame];
    if ([prevFrame isScorePending]) {
        if (self.frames.count > 2) {
            Frame *prev2Frame = [self get2PreviousFrame:inProgressFrame];
            if ([prev2Frame isScorePending]) {
                if (self.frames.count >3) {

                    [self setFrameScore:([self get3PreviousFrame:inProgressFrame].score + 20 + inProgressFrame.firstBall) inFrame:[self.frames indexOfObject:prev2Frame]];
                    prev2Frame.scorePending = NO;
                    if (![inProgressFrame isStrike]) {
                        [self setFrameScore:([self get2PreviousFrame:inProgressFrame].score + 10 + inProgressFrame.firstBall + inProgressFrame.secondBall) inFrame:[self.frames indexOfObject:prevFrame]];
                        prevFrame.scorePending = NO;
                        [self getNewFrame];
                    }

                } else {
                    [self setFrameScore:(20 + inProgressFrame.firstBall) inFrame:[self.frames indexOfObject:prev2Frame]];
                    prev2Frame.scorePending = NO;
                    if (![inProgressFrame isStrike]) {
                        [self setFrameScore:([self get2PreviousFrame:inProgressFrame].score + 10 + inProgressFrame.firstBall + inProgressFrame.secondBall) inFrame:[self.frames indexOfObject:prevFrame]];
                        prevFrame.scorePending = NO;
                        [self getNewFrame];
                    }

                }
            } else {
                // still do something
            }
        }
    }

}


@end
