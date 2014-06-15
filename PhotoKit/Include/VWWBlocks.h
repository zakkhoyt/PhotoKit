//
//  APM Logger
//
//  Created by Zakk Hoyt 2014
//  Copyright (c) 2014 Zakk Hoyt.
//


#ifndef VWW_iOS_SMBlocks_h
#define VWW_iOS_SMBlocks_h
@class CLLocation;
@class VWWToken;
typedef void (^VWWArrayBlock)(NSArray *array);
typedef void (^VWWBoolBlock)(BOOL success);
typedef void (^VWWCLLocationBlock)(CLLocation *location);
typedef void (^VWWDictionaryBlock)(NSDictionary *dictionary);
typedef void (^VWWEmptyBlock)();
typedef void (^VWWErrorBlock)(NSError *error);
typedef void (^VWWErrorStringBlock)(NSError *error, NSString *description);
typedef void (^VWWJSONBlock)(id json);
typedef void (^VWWIntegerBlock)(NSInteger index);
typedef void (^VWWMutableArrayBlock)(NSMutableArray *array);
typedef void (^VWWMutableDictionaryBlock)(NSMutableDictionary *dictionary);
typedef void (^VWWOrderedSetBlock)(NSOrderedSet *set);
typedef void (^VWWProgessBlock)(NSInteger totalBytesSent, NSInteger totalBytesExpectedToSend);
typedef void (^VWWSetBlock)(NSOrderedSet *set);
typedef void (^VWWStringBlock)(NSString *string);
typedef void (^VWWTagCountBlock)(NSUInteger hasTagCount, NSUInteger noTagCount);
typedef void (^VWWTokenBlock)(VWWToken *token);
typedef void (^VWWUIntegerBlock)(NSUInteger index);
typedef void (^VWWURLErrorBlock)(NSURL *url, NSError *error);
#endif
