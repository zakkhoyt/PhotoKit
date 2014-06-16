//
//  PhotosController.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "PhotosController.h"


@interface PhotosController ()
@property (nonatomic, strong) PHPhotoLibrary *photosLibrary;
@property (nonatomic, strong) PHImageManager *imageManager;
@end

@implementation PhotosController


+(PhotosController*)sharedInstance{
    static PhotosController *instance;
    if(instance == nil){
        instance = [[PhotosController alloc]init];
    }
    return instance;
}

-(instancetype)init{
    self = [super init];
    if(self){
        [self initializeClass];
    }
    return self;
}

-(void)initializeClass{
        self.photosLibrary = [PHPhotoLibrary sharedPhotoLibrary];
        self.imageManager = [[PHImageManager alloc]init];
}



-(void)getCollectionsOfCollectionsWithCompletionBlock:(VWWArrayBlock)completionBlock
                                           errorBlock:(VWWErrorBlock)errorBlock{
//#import <Photos/PHPhotoLibrary.h>
//#import <Photos/PhotosTypes.h>
//    
//#import <Photos/PHObject.h>
//#import <Photos/PHAsset.h>
//#import <Photos/PHCollection.h>
//    
//#import <Photos/PHFetchOptions.h>
//#import <Photos/PHFetchResult.h>
//    
//#import <Photos/PHChange.h>
//    
//#import <Photos/PHAssetChangeRequest.h>
//#import <Photos/PHAssetCollectionChangeRequest.h>
//#import <Photos/PHCollectionListChangeRequest.h>
//    
//#import <Photos/PHImageManager.h>
//    
//#import <Photos/PHAdjustmentData.h>
//#import <Photos/PHContentEditingInput.h>
//#import <Photos/PHContentEditingOutput.h>
    
    //[PHPhotoLibrary get]
    PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeMoment subtype:PHAssetCollectionSubtypeAny options:nil];
  
    NSMutableArray *collections = [@[]mutableCopy];
    [result enumerateObjectsUsingBlock:^(PHAssetCollection *collection, NSUInteger idx, BOOL *stop) {
//        VWW_LOG_INFO(@"Class: %@", [obj class]);
        [collections addObject:collection];
        VWW_LOG_INFO(@"collection: %@", collection.localizedLocationNames);
        
    }];
//    PHFetchResult *momentResults = [PHAssetCollection fetchMomentsInMomentList:PHCollectionListTypeMomentYear options:nil];
//    [momentResults enumerateObjectsUsingBlock:^(PHAssetCollection *obj, NSUInteger idx, BOOL *stop) {
//        
//        VWW_LOG_INFO(@"Class: %@", [obj class]);
//    }];

    completionBlock(collections);
//    [PHCollection fetchCollectionsInCollectionList:list options:options];
}


@end
