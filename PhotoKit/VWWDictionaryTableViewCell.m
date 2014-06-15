//
//  VWWDictionaryTableViewCell.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWDictionaryTableViewCell.h"

@interface VWWDictionaryTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation VWWDictionaryTableViewCell

-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = _title;
}

@end
