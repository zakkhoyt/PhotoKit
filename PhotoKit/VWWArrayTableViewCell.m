//
//  VWWArrayTableViewCell.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWArrayTableViewCell.h"


@interface VWWArrayTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end


@implementation VWWArrayTableViewCell


-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = _title;
}
@end
