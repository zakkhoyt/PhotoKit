//
//  AssetGroupTableViewcell.h
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@import AssetsLibrary;
@interface AssetGroupTableViewCell : UITableViewCell
@property (nonatomic, strong) ALAssetsGroup *assetsGroup;
@end
