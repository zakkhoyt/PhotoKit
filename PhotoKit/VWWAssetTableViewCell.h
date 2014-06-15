//
//  VWWAssetTableViewCell.h
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AssetsLibrary;

@class VWWAssetTableViewCell;

@protocol VWWAssetTableViewCellDelegate <NSObject>
-(void)VWWAssetTableViewCellMetaButtonTouchUpInside:(VWWAssetTableViewCell*)sender;
-(void)VWWAssetTableViewCellGeoButtonTouchUpInside:(VWWAssetTableViewCell*)sender;
@end

@interface VWWAssetTableViewCell : UITableViewCell
@property (nonatomic, strong) ALAsset *asset;
@property (nonatomic, weak) id <VWWAssetTableViewCellDelegate> delegate;
@end
