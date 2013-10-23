//
//  NWGameResultViewController.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/23/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWGameResultViewController.h"

@interface NWGameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation NWGameResultViewController

-(void)setup
{
    // initialitation that can't wait until viewDidLoad
}

-(void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}



@end
