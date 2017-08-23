//
//  ITUMCC.h
//  Pods
//
//  Created by 李翔宇 on 2017/8/22.
//
//

#import <Foundation/Foundation.h>
#import "ITUMNC.h"

typedef NS_ENUM(NSUInteger, ITUMCCItem) {
    ITUMCCItemCode = 1,
};

@interface ITUMCC : NSObject

@property (nonatomic, strong, readonly) NSString *mccCode;
@property (nonatomic, strong, readonly) NSArray<ITUMNC *> *mncs;

+ (ITUMCC *)mccWithItems:(NSArray<NSString *> *)items;
- (void)addMNC:(ITUMNC *)mnc;

@end
