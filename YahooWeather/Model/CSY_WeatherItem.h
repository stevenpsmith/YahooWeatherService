//
//  CSY_WeatherItem.h
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSY_WeatherItem : NSObject

@property (nonatomic, strong) NSString *weatherDate;
@property (nonatomic, strong) NSString *weatherText;
@property (nonatomic, strong) NSString *highTemp;
@property (nonatomic, strong) NSString *lowTemp;

- (id) initWithItemDictionary:(NSDictionary *)itemDictionary;

@end
