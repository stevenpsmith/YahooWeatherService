//
//  CSY_WeatherListViewController.m
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import "CSY_WeatherListViewController.h"
#import "CSY_YahooWeatherService.h"
#import "CSY_WeatherItemCell.h"

@interface CSY_WeatherListViewController ()

@property (nonatomic, strong) NSArray *weatherItems;

@end

@implementation CSY_WeatherListViewController
@synthesize table = _table;
@synthesize lblTitle = _lblTitle;
@synthesize zipCode = _zipCode;

@synthesize  weatherItems = _weatherItems;

- (id) initWithZipCode:(NSString *)zipCode {
    self = [super init];
    [self setZipCode:zipCode];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self lblTitle] setText:[NSString stringWithFormat:@"Yahoo Weather for %@", [self zipCode]]];
    
    [CSY_YahooWeatherService retrieveWeatherForecastForZipCode:[self zipCode] withBlock:^(NSArray *weatherItems) {
        [self setWeatherItems:weatherItems];
        [[self table] reloadData];
    }];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [self setLblTitle:nil];
    [self setWeatherItems:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_weatherItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellId = @"WeatherItemCell";
    CSY_WeatherItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CSY_WeatherItemCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    CSY_WeatherItem *weatherItem = [[self weatherItems] objectAtIndex:[indexPath row]];
    [cell setWeatherItem:weatherItem];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64.0f;
}


@end
