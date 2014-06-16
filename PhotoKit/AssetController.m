//
//  AssetController.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "AssetController.h"

@interface AssetController ()
@property (nonatomic, strong, readwrite) NSDate *lastScanDate;
@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
//@property (nonatomic, strong, readwrite) NSMutableArray *photos;
//@property (nonatomic, strong, readwrite) NSMutableArray *filteredPhotos;
//@property (nonatomic, strong, readwrite) NSMutableArray *videos;
//@property (nonatomic, strong, readwrite) NSMutableArray *filteredVideos;
//@property (nonatomic) dispatch_queue_t queue;
//@property (nonatomic) NSInteger counter;
//@property (nonatomic, strong) ALAssetsGroup *albumGroup;
//@property (nonatomic) BOOL permissionGranted;
@end

@implementation AssetController


+(AssetController*)sharedInstance{
    static AssetController *instance;
    if(instance == nil){
        instance = [[AssetController alloc]init];
    }
    return instance;
}



-(instancetype)init{
    self = [super init];
    if(self){
        //        self.photosLibrary = [PHPhotoLibrary sharedPhotoLibrary];
        //        self.imageManager = [[PHImageManager alloc]init];
        [self initializeClass];
    }
    return self;
}



-(void)initializeClass{
    //    _queue = dispatch_queue_create("com.getsmileapp.smile.location", NULL);
    
    //    self.photos = [@[]mutableCopy];
    //    self.videos = [@[]mutableCopy];
    self.assetsLibrary = [[ALAssetsLibrary alloc]init];
    //    [self ensureWebshotsAlbumExistsWithCompletion:^(BOOL success) {
    //        if(success == NO){
    //            VWW_LOG_ERROR(@"Failed to create %@ album", SMSmileAlbumName);
    //        }
    //    }];
    //
    //    [self addLibraryNotificationHandler];
}

#pragma mark SMPermissionsProtocol

//+(BOOL)serviceExists{
//    VWW_LOG_TODO;
//    return YES;
//}
//
//+(BOOL)hasBeenPrompted{
//    NSDate *date = [SMUserDefaults assetsLibraryPermissionDate];
//    return date != nil;
//}

//+(SMPermissionProtocolStatus)permissionStatus{
//    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
//    if(status == ALAuthorizationStatusRestricted){
//        return SMPermissionProtocolStatusRestricted;
//    } else if(status == ALAuthorizationStatusDenied){
//        return SMPermissionProtocolStatusDenied;
//    } else if(status == ALAuthorizationStatusAuthorized){
//        return SMPermissionProtocolStatusAuthorized;
//    }
//    return SMPermissionProtocolStatusNotDetermined;
//}
//

//+(void)displayPermissionPromptWithCompletionBlock:(SMBoolBlock)completionBlock{
//    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc]init];
//    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
//        *stop = YES;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            return completionBlock(YES);
//        });
//
//    } failureBlock:^(NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            return completionBlock(NO);
//        });
//
//    }];
//}

//-(BOOL)permissionGranted{
//    return _permissionGranted;
//}

//-(void)appleAssetForURL:(NSURL*)url completion:(VWWALAssetBlock)completion errorBlock:(VWWErrorBlock)errorBlock{
//    [self.assetsLibrary assetForURL:url resultBlock:^(ALAsset *asset) {
//        completion(asset);
//    } failureBlock:^(NSError *error) {
//        errorBlock(error);
//    }];
//}



#pragma mark Private methods




//-(void)addLibraryNotificationHandler{
//    [[NSNotificationCenter defaultCenter] addObserverForName:ALAssetsLibraryChangedNotification
//                                                      object:self.assetsLibrary
//                                                       queue:[NSOperationQueue mainQueue]
//                                                  usingBlock:^(NSNotification *note) {
//                                                      SM_LOG_TRACE;
//                                                      [self printNotification:note];
//                                                  }];
//
//
//
//    [[NSNotificationCenter defaultCenter] addObserverForName:ALAssetLibraryUpdatedAssetsKey
//                                                      object:self.assetsLibrary
//                                                       queue:[NSOperationQueue mainQueue]
//                                                  usingBlock:^(NSNotification *note) {
//                                                      SM_LOG_TRACE;
//                                                      [self printNotification:note];
//                                                  }];
//    [[NSNotificationCenter defaultCenter] addObserverForName:ALAssetLibraryInsertedAssetGroupsKey
//                                                      object:self.assetsLibrary
//                                                       queue:[NSOperationQueue mainQueue]
//                                                  usingBlock:^(NSNotification *note) {
//                                                      SM_LOG_TRACE;
//                                                      [self printNotification:note];
//                                                  }];
//
//    [[NSNotificationCenter defaultCenter] addObserverForName:ALAssetLibraryUpdatedAssetGroupsKey
//                                                      object:self.assetsLibrary
//                                                       queue:[NSOperationQueue mainQueue]
//                                                  usingBlock:^(NSNotification *note) {
//                                                      SM_LOG_TRACE;
//                                                      [self printNotification:note];
//                                                  }];
//
//    [[NSNotificationCenter defaultCenter] addObserverForName:ALAssetLibraryDeletedAssetGroupsKey
//                                                      object:self.assetsLibrary
//                                                       queue:[NSOperationQueue mainQueue]
//                                                  usingBlock:^(NSNotification *note) {
//                                                      SM_LOG_TRACE;
//                                                      [self printNotification:note];
//                                                  }];
//
//}
//
//
//-(void)printNotification:(NSNotification*)note{
//    // This is called with the main queue. We need to dispatch this in the background else GUI freeze.
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString *name = note.name;
//        NSObject *object = note.object;
//        NSDictionary *userInfo = note.userInfo;
//        SM_LOG_DEBUG(@"Name: %@\n"
//                     @"Object: %@\n"
//                     @"UserInfo: %@\n",
//                     name,
//                     object.description,
//                     userInfo.description)
//
//
//        // Set this flag then start the uploader which will reindex the photos.
//        self.hasChangedSinceLastIndex = YES;
//        [[SMUploadController sharedInstance] start];
//
//    });
//
//}


//-(void)ensureWebshotsAlbumExistsWithCompletion:(SMBoolBlock)completion{
//
//    // Iterate the asset groups to find webshots and record the URL. If it doesn't exist, create it.
//    __weak SMAssetController *weakSelf = self;
//    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
//        self.permissionGranted = YES;
//        NSString *groupName = [group valueForProperty:ALAssetsGroupPropertyName];
//        if([groupName isEqualToString:SMSmileAlbumName]){
//            weakSelf.albumGroup = group;
//            SM_LOG_INFO(@"Found Smile Photo Album. Group = %@", weakSelf.albumGroup);
//            *stop = YES;
//            return completion(YES);
//        } else if(group == nil && weakSelf.albumGroup == nil){
//            // If we get here, we've finished iterating through the group names but have
//            // not found Smile. Create it
//            [self.assetsLibrary addAssetsGroupAlbumWithName:SMSmileAlbumName resultBlock:^(ALAssetsGroup *group) {
//                if(group){
//                    weakSelf.albumGroup = group;
//                    SM_LOG_INFO(@"Created Webshots Photo Album. Group = %@", weakSelf.albumGroup);
//                    return completion(YES);
//                } else {
//                    // SM_LOG_INFO(@"Not Webshots Photo Album. Group = %@", weakSelf.webshotsAlbumGroup);
//                }
//
//
//            } failureBlock:^(NSError *error) {
//                weakSelf.albumGroup = nil;
//                SM_LOG_ERROR(@"***** ERROR! Failed to create Webshots Photo Album Group");
//                return completion(NO);
//            }];
//
//        }
//
//    } failureBlock:^(NSError *error) {
//        SM_LOG_ERROR(@"***** ERROR! Failed to create Smile Photo Album because of access permissions");
//        return completion(NO);
//    }];
//}

//-(void)saveImageToWebshotsAlbum:(UIImage*)image
//                       metadata:(NSDictionary *)metadata
//                     completion:(SMErrorBlock)completion{
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        // Save to camera roll
//        [self.assetsLibrary writeImageToSavedPhotosAlbum:image.CGImage metadata:metadata completionBlock:^(NSURL *assetURL, NSError *error){
//            // Make a link to the Webshots album
//            [self.assetsLibrary assetForURL:assetURL resultBlock:^(ALAsset *asset) {
//                SM_LOG_INFO(@"assetURL: %@", assetURL.absoluteString);
//                [self.albumGroup addAsset:asset];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    SM_LOG_INFO(@"Wrote photo into Webshots album");
//                    completion(nil);
//                });
//
//            } failureBlock:^(NSError *error) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    SM_LOG_ERROR(@"Failed to write photo into Webshots album");
//                    completion(error);
//                });
//            }];
//        }];
//    });
//}

-(BOOL)date:(NSDate*)date1 isBeforeDate:(NSDate*)date2{
    return [date1 compare:date2] == NSOrderedAscending;
}

@end

@implementation AssetController (AssetsLibrary)




#pragma mark Public methods

-(void)countAllPhotosWithCompletionBlock:(VWWIntegerBlock)completionBlock errorBlock:(VWWErrorBlock)errorBlock{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        __block NSInteger photosCount = 0;
        NSUInteger groups = ALAssetsGroupLibrary | ALAssetsGroupAlbum | ALAssetsGroupEvent | ALAssetsGroupFaces | ALAssetsGroupSavedPhotos;
        [self.assetsLibrary enumerateGroupsWithTypes:groups usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            // We are done enumerating groups
            if(group == nil){
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionBlock(photosCount);
                });
                return;
            }
            // Just photos
            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            {
                photosCount += [group numberOfAssets];
            }
        } failureBlock:^(NSError *error) {
            errorBlock(error);
        }];
    });
}
-(void)getAssetGroupsWithCompletionBlock:(VWWArrayBlock)completionBlock errorBlock:(VWWErrorBlock)errorBlock{
    NSMutableArray *assetGroups = [@[]mutableCopy];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //        NSUInteger groups = ALAssetsGroupLibrary | ALAssetsGroupAlbum | ALAssetsGroupEvent | ALAssetsGroupFaces | ALAssetsGroupSavedPhotos;
        NSUInteger groups = ALAssetsGroupAll;
        [self.assetsLibrary enumerateGroupsWithTypes:groups usingBlock:^(ALAssetsGroup *group, BOOL *stopGroups) {
            NSString *title = [group valueForProperty:ALAssetsGroupPropertyName];
            VWW_LOG_DEBUG(@"Group name is %@", title);
            
            if(group == nil){
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionBlock(assetGroups);
                });
                
            } else {
                [assetGroups addObject:group];
            }
        } failureBlock:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                errorBlock(error);
            });
        }];
    });
}
-(void)getAssetsForGroup:(ALAssetsGroup*)assetsGroup completionBlock:(VWWArrayBlock)completionBlock{
    NSMutableArray *assets = [@[]mutableCopy];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [assetsGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
        [assetsGroup enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stopAssets) {
            if(asset){
                [assets addObject:asset];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(assets);
            });
        }];
    });
}

-(void)getTagCountForGroups:(ALAssetsGroup*)assetsGroup updateBlock:(VWWTagCountBlock)updateBlock{
//    NSString *title = [group valueForProperty:ALAssetsGroupPropertyName];
//    VWW_LOG_INFO(@"Getting tags for group: %@", title)

    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        __block NSInteger hasTagCount = 0;
        __block NSInteger noTagCount = 0;
        
        [assetsGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // We are iterating in reverse because we want the newest photos first.
        [assetsGroup enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stopAssets) {
            if(asset){
                NSDictionary *metaData = asset.defaultRepresentation.metadata;
                if(metaData == nil){
                    noTagCount++;
                } else {
                    hasTagCount++;
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                updateBlock(hasTagCount, noTagCount);
            });

        }];
    });
}


-(void)getMetadataForAssetAtURL:(NSURL*)url completionBlock:(VWWDictionaryBlock)completionBlock errorBlock:(VWWErrorBlock)errorBlock{
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self.assetsLibrary assetForURL:url resultBlock:^(ALAsset *asset){
            ALAssetRepresentation *representation = [asset defaultRepresentation];
            NSDictionary *metaData = [representation metadata];
            //            dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(metaData);
            //            });
            
        } failureBlock:^(NSError *error) {
            errorBlock(error);
        }];
    });
}


-(NSDictionary*)readPhotoTagsFromFile:(NSString*)file{
    NSDictionary* dic;
    NSURL* url =[NSURL fileURLWithPath:file];
    
    if(url){
        CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)CFBridgingRetain(url), NULL);
        
        if(source == NULL){
#ifdef _DEBUG
            CGImageSourceStatus status = CGImageSourceGetStatus ( source );
            NSLog ( @"Error: file name : %@ - Status: %d", file, status );
#endif
        }
        else{
            CFDictionaryRef metadataRef = CGImageSourceCopyPropertiesAtIndex(source, 0, NULL);
            if(metadataRef){
                NSDictionary* immutableMetadata = (NSDictionary *)CFBridgingRelease(metadataRef);
                if(immutableMetadata){
                    dic = [NSDictionary dictionaryWithDictionary:(NSDictionary *)CFBridgingRelease(metadataRef)];
                }
                CFRelease(metadataRef);
            }
            
            CFRelease(source);
            source = nil;
        }
    }
    
    return dic;
}


+(NSDictionary*)appendGPSLocation:(CLLocation*)location toMetadata:(NSDictionary*)metadata{
    NSString *latitudeRef;
    NSString *longitudeRef;
    NSNumber *latitude;
    NSNumber *longitude;
    if (location.coordinate.latitude < 0.0) {
        latitude = [NSNumber numberWithFloat:-location.coordinate.latitude];
        latitudeRef = @"S";
    }
    else {
        latitude = [NSNumber numberWithFloat:location.coordinate.latitude];
        latitudeRef = @"N";
    }
    
    if (location.coordinate.longitude < 0.0) {
        longitude = [NSNumber numberWithFloat:-location.coordinate.longitude];
        longitudeRef = @"W";
    }
    else {
        longitude = [NSNumber numberWithFloat:location.coordinate.longitude];
        longitudeRef = @"E";
    }
    
    NSDictionary *gps = @{(NSString*)kCGImagePropertyGPSLatitude : latitude,
                          (NSString*)kCGImagePropertyGPSLatitudeRef : latitudeRef,
                          (NSString*)kCGImagePropertyGPSLongitude : longitude,
                          (NSString*)kCGImagePropertyGPSLongitudeRef : longitudeRef,
                          (NSString*)kCGImagePropertyGPSAltitude : @(location.altitude)};
    
    NSMutableDictionary *md = [metadata mutableCopy];
    [md setObject:gps forKey:(NSString*)kCGImagePropertyGPSDictionary];
    return md;
}





//-(void)indexAllPhotosMaxCount:(NSNumber*)countMax
//             enqueueForUpload:(BOOL)enqueueForUpload
//                  updateBlock:(VWWPhotoBlock)updateBlock
//              completionBlock:(VWWArrayBlock)completionBlock
//                   errorBlock:(VWWErrorBlock)errorBlock{
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    for(UIView *subview in [button subviews]){
//        subview.opaque = YES;
//    }
//
//    dispatch_async(self.queue, ^{
//        NSDate *nextLastScanDate = [NSDate date];
//        self.lastScanDate = [SMUserDefaults lastAssetScanDate];
//
//        self.counter = 0;
//        [self.photos removeAllObjects];
//
//        NSUInteger groups = ALAssetsGroupLibrary | ALAssetsGroupAlbum | ALAssetsGroupEvent | ALAssetsGroupFaces | ALAssetsGroupSavedPhotos;
//        [self.assetsLibrary enumerateGroupsWithTypes:groups usingBlock:^(ALAssetsGroup *group, BOOL *stopGroups) {
//            NSString *title = [group valueForProperty:ALAssetsGroupPropertyName];
//            SM_LOG_DEBUG(@"Group name is %@", title);
//
//            if(group == nil){
//                [[SMUploadJobsController sharedInstance] printJobsWithCompletionBlock:^(void) {
//                    // Write date to NSUserDefaults
//                    [SMUserDefaults setLastAssetScanDate:nextLastScanDate];
//                    if(countMax.integerValue == 0){
//                        [SMUserDefaults setHasPerformedFullScan:YES];
//                    }
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        completionBlock(self.photos);
//                    });
//
//                }];
//
//                return;
//            }
//            // Just photos
//            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
//            {
//                // We are iterating in reverse because we want the newest photos first.
//                [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stopAssets) {
//                    if(countMax.integerValue && self.counter >= countMax.integerValue){
//                        *stopAssets = YES;
//                        *stopGroups = YES;
//                        return;
//                    }
//                    self.counter++;
//                    if(result){
//                        @autoreleasepool {
//                            NSDate *date = [result valueForProperty:ALAssetPropertyDate];
//                            //                            SM_LOG_DEBUG(@"Asset date: %@", [SMUtility stringFromDateFull:date]);
//                            if([self date:date isBeforeDate:self.lastScanDate]){
//                                // We dont' need to scan this group any further
//                                SM_LOG_DEBUG(@"Ignoring the rest of this group. %@ is before %@", [SMUtility stringFromDateFull:date], [SMUtility stringFromDateFull:self.lastScanDate]);
//                                *stopAssets = YES;
//                                return;
//                            }
//
//                            SMPhoto *photo = [[SMPhoto alloc]initWithAppleAsset:result];
//                            if(enqueueForUpload){
//                                SMUploadJob *job = [[SMUploadJob alloc]initWithAsset:photo uploadToS3:NO];
//                                [[SMUploadJobsController sharedInstance] enqueueJob:job completionBlock:^(BOOL success) {
//                                    // we don't care about success as we are updating the GUI
//                                    [self.photos addObject:photo];
//                                    dispatch_async(dispatch_get_main_queue(), ^{
//                                        updateBlock(photo);
//                                    });
//                                }];
//                            } else {
//                                [self.photos addObject:photo];
//                                dispatch_async(dispatch_get_main_queue(), ^{
//                                    updateBlock(photo);
//                                });
//                            }
//                        }
//                    }
//                }];
//            }
//        } failureBlock:^(NSError *error) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                errorBlock(error);
//            });
//        }];
//    });
//}

@end

@implementation AssetController (Save)
-(void)saveAsset:(ALAsset*)asset metadata:(NSDictionary*)metadata completionBlock:(VWWBoolBlock)completionBlock{
//    [asset writeModifiedImageDataToSavedPhotosAlbum:nil metadata:<#(NSDictionary *)#> completionBlock:<#^(NSURL *assetURL, NSError *error)completionBlock#>]
    
    
//    // Returns YES if the application is able to edit the asset.  Returns NO if the application is not able to edit the asset.
//    // Applications are only allowed to edit assets that they originally wrote.
//    @property (nonatomic, readonly, getter=isEditable) BOOL editable __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
//    
//    // Replaces the image data in the calling asset with the supplied image data.
//    // The caller should check the editable property of the asset to see if it is possible to replace the image data.
//    // If the application is able to edit the asset, the completion block will return the same assetURL as the calling asset, since a new asset is not being created.
//    // If the application is not able to edit the asset, the completion block will return a nil assetURL and an ALAssetsLibraryWriteFailedError.
//    - (void)setImageData:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

//    if([asset isEditable] == NO){
//        
//    } else {

//        CGDataProviderRef provider = CGImageGetDataProvider(asset.defaultRepresentation.fullResolutionImage);
//        NSData* data = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
//        [asset writeModifiedImageDataToSavedPhotosAlbum:data metadata:metadata completionBlock:^(NSURL *assetURL, NSError *error) {
//            completionBlock(assetURL);
//        }];
    
    [self.assetsLibrary writeImageToSavedPhotosAlbum:asset.defaultRepresentation.fullResolutionImage
                            metadata:metadata
                     completionBlock:^(NSURL *assetURL, NSError *error) {
                         if(error){
                             VWW_LOG_ERROR(@"Could not save image to saved photos album: %@", error.description);
                         }
                         completionBlock(assetURL != nil);
                     }];
    
//    }
}
@end
//-(void)getThingsWithCompletionBlock:(VWWArrayBlock)arrayBlock{
//    PHFetchResult *results = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:nil];
//    NSLog(@"Found %ld results", (long)results.count);
//    __block NSUInteger index = 0;
//
//    NSLog(@"");
//
//
//    [results enumerateObjectsUsingBlock:^(PHAsset *obj, NSUInteger idx, BOOL *stop) {
//
//        //        if(obj.assetSource == PHAssetSourceCloudPhotoLibrary){
//        if(index < 10){
//
//            PHImageRequestOptions *options = [[PHImageRequestOptions alloc]init];
//            options.networkAccessAllowed = YES;
//            [options setProgressHandler:^(BOOL degraded, double progress, NSError *error, BOOL *stop) {
//                NSLog(@"progress: %f", progress);
//            }];
//
//            [self.imageManager requestImageForAsset:obj targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeAspectFill options:nil
//                                      resultHandler:^(UIImage *result, NSDictionary *info) {
//                                          NSLog(@"Returned image with size: %@", NSStringFromCGSize(result.size));
//                                      }];
//        }
//        NSLog(@"%ld Asset: isFav:%@ location:%@ date:%@", (long)index++, obj.favorite ? @"YES" : @"NO", obj.location.description, obj.creationDate.description);
//    }];
//
//    NSLog(@"");
//
//}
//
//
//-(void)setFavorite:(PHAsset*)asset{
//    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
//        PHAssetChangeRequest *changeRequest = [PHAssetChangeRequest changeRequestForAsset:asset];
//        [changeRequest setFavorite:!asset.favorite];
//    } completionHandler:^(BOOL success, NSError *error) {
//
//    }];
//}
//
//
//-(void)createAssetForImage:(UIImage*)image{
//    PHAssetChangeRequest *changeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
//
//}


