//
//  RTGProfile.h
//  RTGProfileExample
//
//  Created by fragno on 2017/8/25.
//  Copyright © 2017年 rookie2geek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTGDefines.h"

#if DEBUG

RTG_EXTERN void RTGProfileInit();
RTG_EXTERN void RTGProfileTag(NSString *, ...);
RTG_EXTERN void RTGProfileEnd();

RTG_EXTERN void RTGProfileEventBegin(NSString *, ...);
RTG_EXTERN void RTGProfileEventEnd(NSString *, ...);

#else

#define RTGProfileInit()
#define RTGProfileTag(...)
#define RTGProfileEnd()

#define RTGProfileEventBegin(...)
#define RTGProfileEventEnd(...)

#endif
