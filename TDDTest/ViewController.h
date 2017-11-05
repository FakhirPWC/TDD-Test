//
//  ViewController.h
//  TDDTest
//
//  Created by Syed Fakhir on 10/30/17.
//  Copyright © 2017 PWC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Country.h"

@interface ViewController : UIViewController

@property (nonatomic) NSArray<Country *> *countries;

@property (weak, nonatomic) IBOutlet UITableView *countriesTableView;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addCountryButton;

@end

