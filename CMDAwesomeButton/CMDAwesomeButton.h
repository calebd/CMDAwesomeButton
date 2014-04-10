//
//  CMDAwesomeButton.h
//  CMDAwesomeButton
//
//  Created by Caleb Davenport on 4/9/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

@interface CMDAwesomeButton : UIButton

#pragma mark - General methods

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath controlState:(UIControlState)state;

#pragma mark - Convenience methods

- (void)setBackgroundColor:(UIColor *)color forControlState:(UIControlState)state;
- (void)setBorderColor:(UIColor *)color forControlState:(UIControlState)state;
- (void)setBorderWidth:(CGFloat)width forControlState:(UIControlState)state;
- (void)setCornerRadius:(CGFloat)radius forControlState:(UIControlState)state;

@end
