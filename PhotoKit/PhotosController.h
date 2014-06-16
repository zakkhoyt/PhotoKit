//
//  PhotosController.h
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VWW.h"

@import Photos;
@import CoreLocation;

@interface PhotosController : NSObject
+(PhotosController*)sharedInstance;
-(void)getCollectionsOfCollectionsWithCompletionBlock:(VWWArrayBlock)completionBlock errorBlock:(VWWErrorBlock)errorBlock;
@end
