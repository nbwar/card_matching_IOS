//
//  NWGameResult.h
//  card_matching
//
//  Created by Nicholas Wargnier on 10/23/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NWGameResult : NSObject
@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic)float score;

+(NSArray *)allGameResults;

@end
