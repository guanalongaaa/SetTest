//
//  PPDebug.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//


#ifdef DEBUG
#define PPLOG(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define PPLOG(xx, ...)  ((void)0)
#endif

#ifdef DEBUG
#define PPDASSERT(xx) { if (!(xx)) { PPLOG(@"ASSERT failed: %s", #xx); abort(); } } ((void)0)
#else
#define PPDASSERT(xx) ((void)0)
#endif

#ifdef DEBUG
#define PPDPRINTMETHODNAME() PPLOG(@"%s", __PRETTY_FUNCTION__)
#else
#define PPDPRINTMETHODNAME() ((void)0)
#endif




