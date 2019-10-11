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

                                            //This not being int or being called "identification" instead of "id" might be an issue
@property(nonatomic, copy, readonly, nonnull)NSString *identification;
@property(nonatomic, copy, readonly, nonnull)NSString *title;
                                            //NSDecimalNumber ????
@property(nonatomic, copy, readonly, nullable)NSString *vote_average;
@property(nonatomic, copy, readonly, nullable)NSString *overview;
@property(nonatomic, copy, readonly, nullable)NSString *poster_path;

- (instancetype)initWithMovie:(NSString *)identification title:(NSString *)title vote_average:(NSString *)vote_average overview:(NSString *)overview poster_path:(NSString *)poster_path;

@end

@interface JSMovie (JSONConvertable)
-(JSMovie *)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
