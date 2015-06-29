//
//  CMDAwesomeButton.h
//  CMDAwesomeButton
//
//  Created by Caleb Davenport on 4/9/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//


#if defined(__has_feature) && __has_feature(modules)
    @import UIKit;
#else
    #import <UIKit/UIKit.h>
#endif
#import <CMDAwesomeButton/CMDAwesomeControl.h>

#ifndef CMDAWESOMEBUTTON_FRAMEWORK
#define CMDAWESOMEBUTTON_FRAMEWORK 0
#endif

#if CMDAWESOMEBUTTON_FRAMEWORK
FOUNDATION_EXPORT double CMDAwesomeButtonVersionNumber;
FOUNDATION_EXPORT const unsigned char CMDAwesomeButtonVersionString[];
#endif

@interface CMDAwesomeButton : UIButton

#pragma mark - Properties

@property (nonatomic) UIView *backgroundView;

#pragma mark - General methods

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath state:(UIControlState)state;

#pragma mark - Convenience methods

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
- (void)setBorderColor:(UIColor *)color forState:(UIControlState)state;
- (void)setTintColor:(UIColor *)color forState:(UIControlState)state;
- (void)setBorderWidth:(CGFloat)width forState:(UIControlState)state;
- (void)setCornerRadius:(CGFloat)radius forState:(UIControlState)state;

@end
