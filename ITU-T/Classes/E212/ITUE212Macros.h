//
//  ITUE212Macros.h
//  Pods
//
//  Created by 李翔宇 on 2017/8/22.
//
//

#ifndef ITUE212Macros_h
#define ITUE212Macros_h

#if DEBUG
    #define ITUE212Log(_Format, ...)\
    do {\
        NSString *file = [NSString stringWithUTF8String:__FILE__].lastPathComponent;\
        NSLog((@"\n[%@][%d][%s]\n" _Format), file, __LINE__, __PRETTY_FUNCTION__, ## __VA_ARGS__);\
        printf("\n");\
    } while(0)
#else
    #define ITUE212Log(_Format, ...)
#endif

#endif /* ITUE212Macros_h */
