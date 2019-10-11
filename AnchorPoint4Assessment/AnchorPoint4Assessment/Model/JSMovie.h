//
//  JSMovie.h
//  AnchorPoint4Assessment
//
//  Created by Josh Sparks on 10/11/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSMovie : NSObject


@property(nonatomic, copy, readonly, nonnull)NSString *title;
@property(nonatomic, readonly, nullable)NSNumber * vote_average;
@property(nonatomic, copy, readonly, nullable)NSString *overview;
@property(nonatomic, copy, readonly, nullable)NSString *poster_path;

- (instancetype)initWithMovieTitle:(NSString *)title vote_average:(NSNumber *)vote_average overview:(NSString *)overview poster_path:(NSString *)poster_path;

@end

@interface JSMovie (JSONConvertable)
-(JSMovie *)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
