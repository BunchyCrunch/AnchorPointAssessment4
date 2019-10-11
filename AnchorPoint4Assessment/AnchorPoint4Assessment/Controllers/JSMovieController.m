//
//  JSMovieController.m
//  AnchorPoint4Assessment
//
//  Created by Josh Sparks on 10/11/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

#import "JSMovieController.h"

@implementation JSMovieController

static NSString * const kBaseURLString = @"https://api.themoviedb.org";
static NSString * const kVersionComponentString = @"3";
static NSString * const kSearchComponentString = @"search";
static NSString * const kMovieComponentString = @"movie";
static NSString * const kApiKeyKey = @"api_key";
static NSString * const kApiKeyValue = @"626d672a0da2861da16a3f9f5cf499ff";

static NSString * const kImageBaseURLString = @"https://image.tmdb.org/t/p/w500";

+ (instancetype)sharedController
{
    static JSMovieController * sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [JSMovieController new];
    });
    return sharedController;
}

- (void)fetchMovie:(NSString *)searchText completion:(void (^)(NSArray<JSMovie *> * _Nullable))completion;
{
    NSURL * url = [NSURL URLWithString:kBaseURLString];
    NSURL * versionComponentURL = [url URLByAppendingPathComponent:kVersionComponentString];
    NSURL * searchComponentURL = [versionComponentURL URLByAppendingPathComponent:kSearchComponentString];
    NSURL * movieComponentURL = [searchComponentURL URLByAppendingPathComponent:kMovieComponentString];
    NSURLQueryItem * apiKey = [NSURLQueryItem queryItemWithName:kApiKeyKey value:kApiKeyValue];
    NSURLQueryItem * movieQueryItem = [NSURLQueryItem queryItemWithName:@"query" value:(searchText)];
    
    NSURLComponents * components = [NSURLComponents componentsWithURL:movieComponentURL resolvingAgainstBaseURL:true];
    
    components.queryItems = @[apiKey, movieQueryItem];
    NSURL *finalURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary * topLevelDict = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (error)
            {
                NSLog(@"Error parsing JSON data: %@", [error localizedDescription]);
                completion(nil);
                return;
            }
            
            NSMutableArray *movieArray = [NSMutableArray new];
            
            NSArray *resultsArray = topLevelDict[@"results"];
            for (NSDictionary * secondDictionary in resultsArray)
            {
                JSMovie *movie = [[JSMovie alloc] initWithDictionary:secondDictionary];
                [movieArray addObject:movie];
            }
            completion(movieArray);
        }
    }] resume];
} // end of fetchMovie

//- (void)fetchImage:(JSMovie *)image completion:(void (^)(UIImage * _Nullable))completion
//{
//    NSURL * imageURL = [NSURL URLWithString:kImageBaseURLString];
//    NSURL * finalURL = [imageURL URLByAppendingPathComponent:image.poster_path];
//
//    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error)
//        {
//            NSLog(@"Error fetching image: %@", error);
//            completion(nil);
//            return;
//        }
//        if (response)
//        {
//            NSLog(@"%@", response);
//        }
//
//        if (!data)
//        {
//            NSLog(@"Error with image data");
//            completion(nil);
//            return;
//        }
//        UIImage *image = [UIImage imageWithData:data];
//        completion(image);
//    }]resume];
//}
//

@end
