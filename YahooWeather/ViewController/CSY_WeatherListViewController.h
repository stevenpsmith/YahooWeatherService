//
//  CSY_WeatherListViewController.h
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSY_WeatherListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *zipCode;

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

- (id) initWithZipCode:(NSString *)zipCode;

@end
