//
//  Country.m
//  TDDTest
//
//  Created by Syed Fakhir on 10/30/17.
//  Copyright © 2017 PWC. All rights reserved.
//

#import "Country.h"

@implementation Country
    
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    
    if (self) {
        _name = name;
    }
    
    return self;
}

@end
