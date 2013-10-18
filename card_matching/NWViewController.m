//
//  NWViewController.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWViewController.h"
#import "NWPlayingCardDeck.h"
#import "NWCard.h"
#import "NWGame.h"

@interface NWViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) NWPlayingCardDeck *deck;
@property (strong, nonatomic) NWGame *game;
@end

@implementation NWViewController

-(NWPlayingCardDeck *)deck
{
    if (!_deck) {
        _deck = [[NWPlayingCardDeck alloc] init];
    }
    return _deck;
}

-(NWGame *)game
{
    if (!_game) {
        _game = [[NWGame alloc] init];
    }
    return _game;
}


-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %i", flipCount];
}


- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.flipCount++;
    NWCard *card = [self.deck drawRandomCard];
    NSLog(@"%@", card.contents);
    [sender setTitle:card.contents forState:UIControlStateSelected];
    
}

@end
