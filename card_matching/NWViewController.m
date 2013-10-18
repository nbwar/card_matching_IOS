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
#import "NWPlayingCard.h"
#import "NWGame.h"

@interface NWViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) NWGame *game;
@property (strong, nonatomic) NWDeck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation NWViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.game startGame];
    [self connectCardButtons:self.cardButtons];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}


-(void)connectCardButtons:(NSArray *)cardButtons
{
    int i = 0;
    for (UIButton *cardButton in self.cardButtons) {
        NWCard *card = self.game.currentCards[i];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        i++;
    }
        
}

-(NWDeck *)deck
{
    if (!_deck) _deck = [[NWPlayingCardDeck alloc] init];
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
    
}

@end
