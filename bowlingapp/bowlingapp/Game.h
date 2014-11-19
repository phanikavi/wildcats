//
//  Game.h
//  bowlingapp
//
//  Created by Irene Cascaron on 11/18/14.
//  Copyright (c) 2014 Hashim Shafique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject


- (void)playGame;
- (void)rollBall:(NSInteger)pins completion:(void (^)(BOOL resetPins))completion;
- (NSInteger)calculateTotal;

@end
