//
//  CMDAwesomeControl.m
//  CMDAwesomeButton
//
//  Created by Caleb Davenport on 9/5/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

#import "CMDAwesomeControl.h"

@interface CMDAwesomeControl ()

@property (nonatomic, readonly) NSMutableDictionary *storage;

@end

@implementation CMDAwesomeControl

#pragma mark - Properties

@synthesize storage = _cmd_storage;

- (NSMutableDictionary *)storage {
    if (!_cmd_storage) {
        _cmd_storage = [[NSMutableDictionary alloc] init];
    }
    return _cmd_storage;
}


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

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath state:(UIControlState)state {
    NSMutableDictionary *storage = [self storageForControlState:state];
    storage[keyPath] = value;
    [self applyStorageForCurrentState];
}


#pragma mark - Private

- (NSString *)storageKeyForControlState:(UIControlState)state {
    return [@(state) stringValue];
}

- (NSMutableDictionary *)storageForControlState:(UIControlState)state {
    NSString *key = [self storageKeyForControlState:state];
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
    NSMutableDictionary *mergedStorage = [[NSMutableDictionary alloc] init];
    [mergedStorage addEntriesFromDictionary:defaultStateStorage];
    [mergedStorage addEntriesFromDictionary:currentStateStorage];
    [mergedStorage enumerateKeysAndObjectsUsingBlock:^(NSString *key, id object, BOOL *stop) {
        [self setValue:object forKeyPath:key];
    }];
}

@end
