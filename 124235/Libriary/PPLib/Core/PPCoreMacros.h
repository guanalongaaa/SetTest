//
//  PPCoreMacros.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//


#define PP_RELEASE(__POINTER) { [__POINTER release]; __POINTER = nil; }
#define PP_INVALIDATE_TIMER(__TIMER) { [__TIMER invalidate]; __TIMER = nil; }
#define PP_RETAIN(__new, __old) { [__new retain]; [__old release]; __old = __new; }
#define UICOLOR_RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UICOLOR_RGB(r, g, b) UICOLOR_RGBA(r, g, b, 1)