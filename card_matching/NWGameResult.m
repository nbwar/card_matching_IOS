//
//  GameResult.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/23/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWGameResult.h"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"
#define ALL_RESULTS_KEY @"GameResult_All"

@interface  NWGameResult()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;
@end

@implementation NWGameResult

-(id)init
{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    
    return self;
}

-(NSTimeInterval)duration
{
    NSLog(@"%@", self.end);
    NSLog(@"%@", self.start);
    return [self.end timeIntervalSinceDate:self.start];
}

-(void)setScore:(float)score
{
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}

-(void)synchronize
{
    NSMutableDictionary *mutableGameResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableGameResultsFromUserDefaults) mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



-(id)asPropertyList
{
    return @{ START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score)};
}

+(NSArray *)allGameResults
{
    NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
    
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]) {
        NWGameResult *result = [[NWGameResult alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    
    return allGameResults;
}


//convience initializer
-(id)initFromPropertyList:(id)plist
{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDictionary = plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary[END_KEY];
            _score = [resultDictionary[SCORE_KEY] floatValue];
            if (!_start || !_end) self = nil;
        }
    }
    return self;
}


@end
