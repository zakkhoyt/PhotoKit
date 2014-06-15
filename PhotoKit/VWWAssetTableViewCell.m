//
//  VWWAssetTableViewCell.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWAssetTableViewCell.h"
#import "AssetController.h"

@interface VWWAssetTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *assetImageView;

//@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
//@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
//@property (weak, nonatomic) IBOutlet UILabel *geoLabel;
@end


@implementation VWWAssetTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAsset:(ALAsset *)asset{
    _asset = asset;
    
    self.imageView.image = [UIImage imageWithCGImage:self.asset.thumbnail];
    

}
- (IBAction)metaButtonTouchUpInside:(id)sender {
    [self.delegate VWWAssetTableViewCellMetaButtonTouchUpInside:self];
}
- (IBAction)geoButtonTouchUpInside:(id)sender {
    [self.delegate VWWAssetTableViewCellGeoButtonTouchUpInside:self];
}

@end
