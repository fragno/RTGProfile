//
//  RTGProfile.m
//  RTGProfileExample
//
//  Created by fragno on 2017/8/25.
//  Copyright © 2017年 rookie2geek. All rights reserved.
//

#import "RTGProfile.h"

#if DEBUG

static NSMutableDictionary *profilingEventDict;
static CFAbsoluteTime profileInitTime;

void RTGProfileInit() {
    profileInitTime = CFAbsoluteTimeGetCurrent();
    profilingEventDict = [NSMutableDictionary dictionary];
}

void RTGProfileTag(NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *log_msg = [[NSString alloc] initWithFormat:format arguments:args];
    NSLog(@"RTGProfile:[sinceInit][%@]: %.3f", log_msg, CFAbsoluteTimeGetCurrent() - profileInitTime);
    va_end(args);
}

void RTGProfileEnd() {
    profileInitTime = 0;
    profilingEventDict = nil;
}

void RTGProfileEventBegin(NSString *evenRTGame, ...) {
    va_list args;
    va_start(args, evenRTGame);
    NSString *evenRTGameMsg = [[NSString alloc] initWithFormat:evenRTGame arguments:args];
    if (![profilingEventDict objectForKey:evenRTGameMsg]) {
        [profilingEventDict setObject:@(CFAbsoluteTimeGetCurrent()) forKey:evenRTGameMsg];
    }else{
        NSLog(@"RTGProfile: error! %@ has already began.", evenRTGameMsg);
    }
    va_end(args);
}

void RTGProfileEventEnd(NSString *evenRTGame, ...) {
    va_list args;
    va_start(args, evenRTGame);
    NSString *evenRTGameMsg = [[NSString alloc] initWithFormat:evenRTGame arguments:args];
    NSLog(@"RTGProfile:[costTime][%@]: %.3f", evenRTGameMsg,
          CFAbsoluteTimeGetCurrent() - [[profilingEventDict objectForKey:evenRTGameMsg] doubleValue]);
    [profilingEventDict removeObjectForKey:evenRTGameMsg];
    va_end(args);
}

#endif
