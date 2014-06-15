//
//  VWWStringTableViewCell.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWStringTableViewCell.h"


@interface VWWStringTableViewCell () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

@end

@implementation VWWStringTableViewCell

-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = _title;
}

-(void)setValue:(NSString *)value{
    self.valueTextField.delegate = self;
    _value = value;
    self.valueTextField.text = _value;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
