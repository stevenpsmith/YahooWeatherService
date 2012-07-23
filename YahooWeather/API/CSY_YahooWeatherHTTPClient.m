//
//  CSY_YahooWeatherAPI.m
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import "CSY_YahooWeatherHTTPClient.h"
#import "AFJSONRequestOperation.h"

@implementation CSY_YahooWeatherHTTPClient

static NSString * const kYahooBaseURL = @"http://query.yahooapis.com/v1/public/yql";

+ (CSY_YahooWeatherHTTPClient *)sharedClient {
    static CSY_YahooWeatherHTTPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[CSY_YahooWeatherHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:kYahooBaseURL]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
