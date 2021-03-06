//
//  CMDAwesomeControl.h
//  CMDAwesomeButton
//
//  Created by Caleb Davenport on 9/5/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

#if defined(__has_feature) && __has_feature(modules)
    @import UIKit;
#else
    #import <UIKit/UIKit.h>
#endif

@interface CMDAwesomeControl : UIControl

#pragma mark - General methods

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath state:(UIControlState)state;

#pragma mark - Convenience methods

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
- (void)setBorderColor:(UIColor *)color forState:(UIControlState)state;
- (void)setTintColor:(UIColor *)color forState:(UIControlState)state;
- (void)setBorderWidth:(CGFloat)width forState:(UIControlState)state;
- (void)setCornerRadius:(CGFloat)radius forState:(UIControlState)state;

@end
