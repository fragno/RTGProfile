//
//  RTGProfile.m
//  RTGProfileExample
//
//  Created by fragno on 2017/8/25.
//  Copyright © 2017年 rookie2geek. All rights reserved.
//

#import "RTGProfile.h"

static NSMutableDictionary *profilingEventDict;
static CFAbsoluteTime profileInitTime;

void RTGProfileInit() {
    profileInitTime = CFAbsoluteTimeGetCurrent();
    profilingEventDict = [NSMutableDictionary dictionary];
}

void RTGProfileTag(NSString *tagName) {
    NSLog(@"RTGProfile: %@ since init: %.3f", tagName, CFAbsoluteTimeGetCurrent() - profileInitTime);
}

void RTGProfileEnd() {
    profileInitTime = 0;
    profilingEventDict = nil;
}

void RTGProfileEventBegin(NSString *eventName) {
    if (![profilingEventDict objectForKey:eventName]) {
        [profilingEventDict setObject:@(CFAbsoluteTimeGetCurrent()) forKey:eventName];
    }else{
        NSLog(@"RTGProfile: error! %@ has already began.", eventName);
    }
}

void RTGProfileEventEnd(NSString *eventName) {
    NSLog(@"RTGProfile: %@ costtime: %.3f", eventName, CFAbsoluteTimeGetCurrent() - [[profilingEventDict objectForKey:eventName] doubleValue]);
    [profilingEventDict removeObjectForKey:eventName];
}

@implementation RTGProfile

@end
