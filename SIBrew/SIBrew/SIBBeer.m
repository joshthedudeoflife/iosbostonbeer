//
//  SIBBeer.m
//  SIBrew
//
//  Created by Joshua Chou on 11/20/13.
//  Copyright (c) 2013 Startup Institute. All rights reserved.
//

#import "SIBBeer.h"

@implementation SIBBeer
- (instancetype)initWithDictionary:(NSDictionary*)dictionary{
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        if([dictionary[@"isOrganic"] isEqualToString:@"N"]){
            self.organic = NO;
        } else if ([dictionary[@"isOrgainic"] isEqualToString:@"Y"]){
            self.organic = YES;
        }
    }
    return self;
}


-(void)takeNumberOfSips:(NSInteger)numberOfSips {
    
    self.fullness = @"full";
    switch (numberOfSips) {
        case 0:
            break;
        
        case 1:
            self.fullness = @"pretty full";
            break;
            
        case 2:
            self.fullness = @"half full half empty";
            break;
            
        case 3:
            self.fullness  = @"almost...";
            break;
            
        case 4:
            self.fullness   =@"you drunk";
            break;
            
        default:
            break;
    }
    
}

-(NSString*)description;
{
    NSMutableString *descString = @"".mutableCopy;
    [descString appendString:[NSString stringWithFormat:@"name: %@\n", self.name]];
    NSString *organicString =@"NO";
    if (self.isOrganic){
        organicString = @"YES";
    }
    [descString appendString:[NSString stringWithFormat:@"isOrganic: %@\n", organicString]];
    [descString appendString:[NSString stringWithFormat:@"Fullness: %@\n", self.fullness]];
    return descString;
}

@end
