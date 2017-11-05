//
//  ViewController.m
//  TDDTest
//
//  Created by Syed Fakhir on 10/30/17.
//  Copyright © 2017 PWC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.countries = @[];
}

- (IBAction)addCountry:(id)sender {
    NSString *text = [[self.countryTextField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (![text length]) { return; }
    
    self.countries = [self.countries arrayByAddingObject:[[Country alloc] initWithName:text]];
    [self.countriesTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[self.countries count] - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.countryTextField setText:nil];
    [self.countryTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.countries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CountryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [[cell textLabel] setText:self.countries[indexPath.row].name];
    
    return cell;
}

@end
