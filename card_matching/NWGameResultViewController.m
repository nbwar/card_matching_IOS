//
//  NWGameResultViewController.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/23/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWGameResultViewController.h"
#import "NWGameResult.h"

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI:[NWGameResult allGameResults]];
}

-(void)updateUI:(NSArray *)results
{
    NSString *displayText = @"";
    for (NWGameResult *result in results) {
        displayText = [displayText stringByAppendingFormat:@"Score: %.02f%% (%@, %0gs) \n", result.score, [self formatDate:result.end], round(result.duration)];
    }
    self.display.text = displayText;
}

-(NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}


- (IBAction)sortByDate
{
    NSMutableArray *dates = [[NWGameResult allGameResults] mutableCopy];
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"end"
                                                 ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray;
    sortedArray = [dates sortedArrayUsingDescriptors:sortDescriptors];
    [self updateUI:sortedArray];

}

@end
