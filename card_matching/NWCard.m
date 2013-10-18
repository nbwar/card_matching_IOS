//
//  NWCard.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWCard.h"



@implementation NWCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for ( NWCard *card in otherCards) {
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}
@end
