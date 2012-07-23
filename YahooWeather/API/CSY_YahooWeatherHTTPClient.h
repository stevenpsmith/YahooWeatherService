//
//  CSY_YahooWeatherAPI.h
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import "AFHTTPClient.h"

@interface CSY_YahooWeatherHTTPClient : AFHTTPClient

+ (CSY_YahooWeatherHTTPClient *)sharedClient;

@end
