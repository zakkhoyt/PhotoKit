//
//  VWWNumberTableViewCell.m
//  PhotoKit
//
//  Created by Zakk Hoyt on 6/15/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWNumberTableViewCell.h"

@interface VWWNumberTableViewCell () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (nonatomic) BOOL floatingPoint;
@end


@implementation VWWNumberTableViewCell
-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = _title;
}

-(void)setValue:(NSNumber *)value{
    if(value.integerValue == floorf(value.floatValue)){
        // Int type
        self.floatingPoint = NO;
    } else {
        // Float type
        self.floatingPoint = YES;
    }
    self.valueTextField.delegate = self;
    _value = value;
    self.valueTextField.text = value.stringValue;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSNumber *number;
    if(self.floatingPoint){
        number = @(textField.text.floatValue);
    } else {
        number = @(textField.text.integerValue);
    }

    [self.delegate numberTableViewCell:self didChangeValue:number];
    [textField resignFirstResponder];
    return NO;
}

@end
