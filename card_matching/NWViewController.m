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
@property (weak, nonatomic) IBOutlet UILabel *matchesLabel;
@property (strong, nonatomic) NWGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) NSMutableArray *flippedUpCards;
@end

@implementation NWViewController

-(NSMutableArray *)flippedUpCards
{
    if(!_flippedUpCards) _flippedUpCards = [[NSMutableArray alloc] init];
    return _flippedUpCards;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.game startGame];
    [self connectCardButtons];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}


-(void)connectCardButtons;
{
    int i = 0;
    for (UIButton *cardButton in self.cardButtons) {
        NWCard *card = self.game.currentCards[i];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        i++;
    }
        
}



-(NWGame *)game
{
    if (!_game) {
        _game = [[NWGame alloc] init];
    }
    return _game;
}


-(void)hide
{
    for (UIButton *button in self.flippedUpCards) {
        button.selected = !button.isSelected;
    }
    [self.flippedUpCards removeAllObjects];
}

-(void)removeCards
{
    for (UIButton *button in self.flippedUpCards) {
        button.hidden = YES;
    }
    [self.flippedUpCards removeAllObjects];
}

-(void)updateFlipCount
{
    [self.game changeFlipCount];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %i", self.game.flipCount];
}

-(void)updateMatchCount
{
    [self.game changeMatchCount];
    self.matchesLabel.text = [NSString stringWithFormat:@"Matches: %i", self.game.matchCount];
}

-(void)checkForGameOver
{
    if ([self.game isGameOver]) {
        NSString *message = [NSString stringWithFormat:@"You Scored: %.02f%%", [self.game score]];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You Win" message:message delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alertView show];
        
    }
}

- (IBAction)flipCard:(UIButton *)sender
{
    if (!sender.isSelected && self.flippedUpCards.count < 2) {
        [self.flippedUpCards addObject:sender];
        sender.selected = !sender.isSelected;


        if (self.flippedUpCards.count == 2 && [self.game isMatch:[self.flippedUpCards[0] titleForState:UIControlStateSelected] card2:[self.flippedUpCards[1] titleForState:UIControlStateSelected]]) {
            [self updateFlipCount];
            [self updateMatchCount];
            [self performSelector:@selector(removeCards) withObject:nil afterDelay:2];
            [self checkForGameOver];
        } else if (self.flippedUpCards.count == 2) {
            [self updateFlipCount];
            [self performSelector:@selector(hide) withObject:nil afterDelay:2];
            [self.game score];
        }
    }
    
}

@end
