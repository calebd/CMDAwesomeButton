//
//  CMDAwesomeButton.m
//  CMDAwesomeButton
//
//  Created by Caleb Davenport on 4/9/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

#import "CMDAwesomeButton.h"

@interface CMDAwesomeButton ()

@property (nonatomic, readonly) NSMutableDictionary *storage;

@end

@implementation CMDAwesomeButton

@synthesize storage = _storage;

#pragma mark - UIControl

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self applyStorageForCurrentState];
}


- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self applyStorageForCurrentState];
}


- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self applyStorageForCurrentState];
}


#pragma mark - Public

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath controlState:(UIControlState)state {
    NSMutableDictionary *storage = [self storageForControlState:state];
    storage[keyPath] = value;
    [self applyStorageForCurrentState];
}


- (id)valueForKeyPath:(NSString *)keyPath controlState:(UIControlState)state {
    NSMutableDictionary *storage = [self storageForControlState:state];
    return storage[keyPath];
}


- (void)setBackgroundColor:(UIColor *)color forControlState:(UIControlState)state {
    [self setValue:color forKeyPath:@"backgroundColor" controlState:state];
}


- (void)setBorderColor:(UIColor *)color forControlState:(UIControlState)state {
    [self setValue:(id)[color CGColor] forKeyPath:@"layer.borderColor" controlState:state];
}


- (void)setBorderWidth:(CGFloat)width forControlState:(UIControlState)state {
    [self setValue:@(width) forKeyPath:@"layer.borderWidth" controlState:state];
}


- (void)setCornerRadius:(CGFloat)radius forControlState:(UIControlState)state {
    [self setValue:@(radius) forKeyPath:@"layer.cornerRadius" controlState:state];
}


#pragma mark - Private

- (NSMutableDictionary *)storageForControlState:(UIControlState)state {
    NSString *key = [@(state) stringValue];
    NSMutableDictionary *dictionary = self.storage[key];
    if (!dictionary) {
        dictionary = [NSMutableDictionary new];
        self.storage[key] = dictionary;
    }
    return dictionary;
}


- (void)applyStorageForCurrentState {
    NSDictionary *defaultStateStorage = [self storageForControlState:UIControlStateNormal];
    NSDictionary *currentStateStorage = [self storageForControlState:self.state];
    NSMutableDictionary *mergedStorage = [NSMutableDictionary new];
    [mergedStorage addEntriesFromDictionary:defaultStateStorage];
    [mergedStorage addEntriesFromDictionary:currentStateStorage];
    [mergedStorage enumerateKeysAndObjectsUsingBlock:^(NSString *key, id object, BOOL *stop) {
        [self setValue:object forKeyPath:key];
    }];
}


#pragma mark - Accessors

- (NSMutableDictionary *)storage {
    if (!_storage) {
        _storage = [NSMutableDictionary new];
    }
    return _storage;
}

@end
