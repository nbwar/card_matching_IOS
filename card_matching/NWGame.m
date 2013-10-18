//
//  NWGame.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWGame.h"
#import "NWPlayingCardDeck.h"
#import "NWCard.h"

@interface NWGame()
@property (strong, nonatomic) NWPlayingCardDeck *deck;
@property (readwrite, nonatomic) int score;
@property (readwrite, nonatomic) int flipCount;
@property (readwrite, nonatomic) int matchCount;

@end

@implementation NWGame

-(void)startGame
{
    self.currentCards = [self chooseCards];

}

-(NWPlayingCardDeck *)deck
{
    if (!_deck) _deck = [[NWPlayingCardDeck alloc] init];
    return _deck;
}


-(NSMutableArray *)currentCards
{
    if(!_currentCards) _currentCards = [[NSMutableArray alloc] init];
    return _currentCards;
}

-(NSMutableArray *)chooseCards;
{
    NSMutableArray *cardsArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger x = 0; x < 6; x++) {
        [cardsArray addObject:[self.deck drawRandomCard]];
    }
    
    [cardsArray addObjectsFromArray:cardsArray];
    cardsArray = [self shuffleCards:cardsArray];
    
    return cardsArray;
}

-(NSMutableArray *)shuffleCards:(NSMutableArray *)cards
{
    NSUInteger firstIndex;
    NSUInteger secondIndex;
    for (NSUInteger i = 0; i < 12; i++) {
        firstIndex = arc4random() % 12;
        secondIndex = arc4random() % 12;
        [cards exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    }
    return cards;
}


-(BOOL)isMatch:(NSString *)card1 card2:(NSString *)card2
{

    if ([card1 isEqualToString:card2]) {
        NSMutableArray *toDelete = [NSMutableArray array];
        for (NWCard *card in self.currentCards) {
            if ([card.contents isEqualToString:card1]) {
                [toDelete addObject:card];
            }
        }
        [self.currentCards removeObjectsInArray:toDelete];
        return YES;
    } else {
        return NO;
    }

}

-(BOOL)isGameOver
{
    return (self.currentCards.count == 0) ? YES : NO;
}

-(void)changeFlipCount
{
    self.flipCount++;
}

-(void)changeMatchCount
{
    self.matchCount++;
}
@end
