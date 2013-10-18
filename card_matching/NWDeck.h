//
//  NWDeck.h
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWCard.h"

@interface NWDeck : NSObject

@property (strong, nonatomic) NSMutableArray *cards;
- (void)addCard:(NWCard *)card atTop:(BOOL)atTop;

- (NWCard *)drawRandomCard;
@end
