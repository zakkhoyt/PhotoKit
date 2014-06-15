//
//  VWWStringTableViewCell.h
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VWWStringTableViewCell;

@protocol VWWStringTableViewCellDelegate <NSObject>
-(void)stringTableViewCell:(VWWStringTableViewCell*)sender didChangeValue:(NSString*)value;
@end

@interface VWWStringTableViewCell : UITableViewCell
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) id <VWWStringTableViewCellDelegate> delegate;
@end
