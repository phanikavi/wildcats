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

@end

@implementation Game

- (id) init
{
    if (self) {
        _totalScore = 0;
    }
    return self;
}

- (void) playGame
{
    if (!self.frames) {
        self.frames = [[NSMutableArray alloc] init];
    }
    //    for (int f=0; f<10; f++) {
        Frame *newFrame = [[Frame alloc] init];
        [self.frames addObject:newFrame];

        [self setFrameScore:10 inFrame:[self.frames indexOfObject:(newFrame)]];
    // }
    [self calculateTotal];
}

- (void)calculateTotal
{
    Frame *lastFrame = [self.frames lastObject];
    self.totalScore = lastFrame.score;
}

- (void)setFrameScore:(NSInteger)score inFrame:(NSInteger)inFrame
{
    Frame *frameToUpdate = [self.frames objectAtIndex:inFrame];
    frameToUpdate.score = score;

}

- (void)playFrame: (NSInteger) playedFrame
{
    Frame *frameToPlay = [self.frames objectAtIndex:playedFrame];
    [self setFrameScore:10 inFrame:[self.frames indexOfObject:[self.frames lastObject]]];
}

@end
