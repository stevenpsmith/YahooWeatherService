//
//  CSY_YahooWeatherService.h
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSY_YahooWeatherService : NSObject

+ (void)retrieveWeatherForecastForZipCode:(NSString *)zipCode withBlock:(void (^)(NSArray *weatherItems))block;

@end
