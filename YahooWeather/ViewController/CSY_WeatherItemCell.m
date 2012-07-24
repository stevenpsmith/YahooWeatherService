//
//  CSY_WeatherItemCell.m
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import "CSY_WeatherItemCell.h"

@implementation CSY_WeatherItemCell
@synthesize lblDate;
@synthesize lblText;
@synthesize lblLow;
@synthesize lblHigh;

- (void) setWeatherItem:(CSY_WeatherItem *)weatherItem {
    [[self lblDate] setText:[weatherItem weatherDate]];
    [[self lblText] setText:[weatherItem weatherText]];
    [[self lblHigh] setText:[weatherItem highTemp]];
    [[self lblLow] setText:[weatherItem lowTemp]];
}

@end
