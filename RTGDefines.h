//
//  RTGDefines.h
//  RTGProfileExample
//
//  Created by fragno on 2017/8/25.
//  Copyright © 2017年 rookie2geek. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Make global functions usable in C++
 */
#if defined(__cplusplus)
#define RTG_EXTERN extern "C" __attribute__((visibility("default")))
#else
#define RTG_EXTERN extern __attribute__((visibility("default")))
#endif
