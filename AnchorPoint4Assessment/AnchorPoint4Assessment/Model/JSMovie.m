//
//  JSMovie.m
//  AnchorPoint4Assessment
//
//  Created by Josh Sparks on 10/11/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import "JSMovie.h"

@implementation JSMovie


- (instancetype)initWithMovie:(NSString *)identification title:(NSString *)title vote_average:(NSString *)vote_average overview:(NSString *)overview poster_path:(NSString *)poster_path
{
    self = [super init];
    if (self)
    {
        _identification = identification;
        _title = title;
        _vote_average = vote_average;
        _overview = overview;
        _poster_path = poster_path;
    }
    return self;
}

@end

@implementation JSMovie (JSONConvertable)

-(JSMovie *)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * identification = dictionary[@"id"];
    NSString * title = dictionary[@"title"];
    NSString * vote_average = dictionary[@"vote_average"];
    NSString * overview = dictionary[@"overview"];
    NSString * poster_path = dictionary[@"poster_path"];
    
    return [self initWithMovie:identification title:title vote_average:vote_average overview:overview poster_path:poster_path];
}

@end
