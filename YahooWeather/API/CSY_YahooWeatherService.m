//
//  CSY_YahooWeatherService.m
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import "CSY_YahooWeatherService.h"
#import "CSY_YahooWeatherHTTPClient.h"
#import "CSY_WeatherItem.h"

@implementation CSY_YahooWeatherService

static NSString * const kYQLQuery = @"SELECT * FROM weather.forecast WHERE location='%@'";

+ (void)retrieveWeatherForecastForZipCode:(NSString *)zipCode withBlock:(void (^)(NSArray *weatherItems))block {
    NSMutableArray *weatherItems = [[NSMutableArray alloc] init];
    NSString *query = [NSString stringWithFormat:kYQLQuery, zipCode];
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:query, @"q", @"json", @"format", nil];
    
    [[CSY_YahooWeatherHTTPClient sharedClient] getPath:@"" parameters:paramsDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *query = [responseObject objectForKey:@"query"];
        NSDictionary *results = [query objectForKey:@"results"];
        NSDictionary *channel = [results objectForKey:@"channel"];
        NSDictionary *item = [channel objectForKey:@"item"];
        NSArray *forecast = [item objectForKey:@"forecast"];
        for (NSDictionary *item in forecast){
            CSY_WeatherItem *weatherItem = [[CSY_WeatherItem alloc] initWithItemDictionary:item];
            [weatherItems addObject:weatherItem];
        }
        if (block){
            block([NSArray arrayWithArray:weatherItems]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
}

@end
