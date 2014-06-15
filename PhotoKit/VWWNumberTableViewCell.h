//
//  VWWNumberTableViewCell.h
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VWWNumberTableViewCell;

@protocol VWWNumberTableViewCellDelegate <NSObject>
-(void)numberTableViewCell:(VWWNumberTableViewCell*)sender didChangeValue:(NSNumber*)value;
@end

@interface VWWNumberTableViewCell : UITableViewCell
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, weak) id <VWWNumberTableViewCellDelegate> delegate;
@end
