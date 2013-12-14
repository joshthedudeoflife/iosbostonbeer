//
//  SIBBeer.h
//  SIBrew
//
//  Created by Joshua Chou on 11/20/13.
//  Copyright (c) 2013 Startup Institute. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIBBeer : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic, getter = isOrganic) BOOL organic;
@property  (nonatomic, strong) NSString *fullness;
- (instancetype)initWithDictionary:(NSDictionary*)dictionary;
-(void)takeNumberOfSips:(NSInteger)numberOfSips;

@end
