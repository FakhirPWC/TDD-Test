//
//  Country.h
//  TDDTest
//
//  Created by Syed Fakhir on 10/30/17.
//  Copyright © 2017 PWC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject
    
@property (nonatomic) NSString *name;
    
- (instancetype)initWithName:(NSString *)name;

@end
