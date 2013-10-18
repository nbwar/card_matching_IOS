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
@property (strong, nonatomic) NWGame *game;
@end

@implementation NWViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    NWGame *game = [[NWGame alloc] init];
    [game startGame];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
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
    NSLog(@"%@", sender.currentTitle);
    self.flipCount++;
//    NWCard *card = [self.deck drawRandomCard];
//    [sender setTitle:card.contents forState:UIControlStateSelected];
    
}

@end
