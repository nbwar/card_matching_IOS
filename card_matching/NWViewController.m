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


-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %i", flipCount];
}

-(void)hide{
    for (UIButton *button in self.flippedUpCards) {
        button.selected = !button.isSelected;
    }
    [self.flippedUpCards removeAllObjects];
}


- (IBAction)flipCard:(UIButton *)sender
{
    if (!sender.isSelected && self.flippedUpCards.count < 2) {
        [self.flippedUpCards addObject:sender];
        sender.selected = !sender.isSelected;

        if (self.flippedUpCards.count == 2 && [self.game isMatch:[self.flippedUpCards[0] titleForState:UIControlStateSelected] card2:[self.flippedUpCards[1] titleForState:UIControlStateSelected]]) {
            NSLog(@"MATCH");
        } else if (self.flippedUpCards.count == 2) {
            [self performSelector:@selector(hide) withObject:nil afterDelay:2];
            self.flipCount++;
        }
    }
    


    
}

@end
