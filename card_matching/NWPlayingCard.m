//
//  NWPlayingCard.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWPlayingCard.h"

@implementation NWPlayingCard

@synthesize suit = _suit;

- (NSString *)contents
{
    NSArray *rankArray = [NWPlayingCard rankArray];
    return [rankArray[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[@"♥", @"♦", @"♠", @"♣"];
}


- (void)setSuit:(NSString *)suit
{
    if ([[NWPlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}


-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

+(NSArray *)rankArray
{
  
    return @[@"?", @"A",@"2", @"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank { return [self rankArray].count - 1; }

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [NWPlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
