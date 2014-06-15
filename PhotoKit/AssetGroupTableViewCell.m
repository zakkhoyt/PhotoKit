//
//  AssetGroupTableViewcell.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "AssetGroupTableViewCell.h"
#import "AssetController.h"
@interface AssetGroupTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *groupImageView;
@property (weak, nonatomic) IBOutlet UILabel *groupTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation AssetGroupTableViewCell
-(void)setAssetsGroup:(ALAssetsGroup *)assetsGroup{
    _assetsGroup = assetsGroup;
    
    NSString *title = [_assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    if(title) self.groupTitleLabel.text = title;
    
    UIImage *image = [UIImage imageWithCGImage:[_assetsGroup posterImage]];
    self.groupImageView.image = image;
    
    NSString *count = [NSString stringWithFormat:@"%ld images ?/?", _assetsGroup.numberOfAssets];
    self.countLabel.text = count;

    
//    [[AssetController sharedInstance] getTagCountForGroups:_assetsGroup updateBlock:^(NSUInteger hasTagCount, NSUInteger noTagCount) {
//        NSString *count = [NSString stringWithFormat:@"%ld images yes:%ld / no:%ld", _assetsGroup.numberOfAssets, (long)hasTagCount, (long)noTagCount];
//        self.countLabel.text = count;
//    }];
}
@end
