//
//  AssetController.h
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>


@import AssetsLibrary;
@import ImageIO;
@import CoreLocation;

#import "VWW.h"

@interface AssetController : NSObject
+(AssetController*)sharedInstance;
-(BOOL)date:(NSDate*)date1 isBeforeDate:(NSDate*)date2;
@end

@interface AssetController (AssetsLibrary)
-(void)countAllPhotosWithCompletionBlock:(VWWIntegerBlock)completionBlock errorBlock:(VWWErrorBlock)errorBlock;
-(void)getAssetGroupsWithCompletionBlock:(VWWArrayBlock)completionBlock errorBlock:(VWWErrorBlock)errorBlock;
-(void)getAssetsForGroup:(ALAssetsGroup*)assetsGroup completionBlock:(VWWArrayBlock)completionBlock;
-(void)getTagCountForGroups:(ALAssetsGroup*)group updateBlock:(VWWTagCountBlock)updateBlock;
@end

@interface AssetController (Save)
-(void)saveAsset:(ALAsset*)asset metadata:(NSDictionary*)metadata completionBlock:(VWWBoolBlock)completionBlock;
@end