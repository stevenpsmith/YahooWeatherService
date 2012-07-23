//
//  CSY_WeatherItem.m
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import "CSY_WeatherItem.h"

@implementation CSY_WeatherItem

@synthesize weatherDate;
@synthesize weatherText;
@synthesize highTemp;
@synthesize lowTemp;


- (id) initWithItemDictionary:(NSDictionary *)itemDictionary {
    self = [super init];
    [self setWeatherDate:[itemDictionary objectForKey:@"date"]];
    [self setWeatherText:[itemDictionary objectForKey:@"text"]];
    [self setHighTemp:[itemDictionary objectForKey:@"high"]];
    [self setLowTemp:[itemDictionary objectForKey:@"low"]];
    return self;
}

- (NSString *)description {
    NSMutableString *descr = [[NSMutableString alloc] init];
    [descr appendString:[NSString stringWithFormat:@"weatherDate: %@", [self weatherDate]]];
    [descr appendString:[NSString stringWithFormat:@"\rweatherText: %@", [self weatherText]]];
    [descr appendString:[NSString stringWithFormat:@"\rhigh: %@", [self highTemp]]];
    [descr appendString:[NSString stringWithFormat:@"\rlow: %@", [self lowTemp]]];
    return [NSString stringWithString:descr];
}

- (void)dealloc {
    [self setWeatherDate:nil];
    [self setWeatherText:nil];
    [self setHighTemp:nil];
    [self setLowTemp:nil];
}

@end
