//
//  JSMovieController.h
//  AnchorPoint4Assessment
//
//  Created by Josh Sparks on 10/11/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSMovieController : NSObject

@property (nonatomic, copy)NSArray <JSMovie *> * movies;

+(instancetype)sharedController;

-(void)fetchMovie:(NSString *)searchText completion:(void(^)(NSArray<JSMovie *> *))completion;

-(void)fetchImage:(JSMovie *)image completion:(void (^)(UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
