//
//  ITUMCC.m
//  Pods
//
//  Created by 李翔宇 on 2017/8/22.
//
//

#import "ITUMCC.h"

@interface ITUMCC ()

@property (nonatomic, strong) NSString *mccCode;
@property (nonatomic, strong) NSMutableArray<ITUMNC *> *mncsM;

@end

@implementation ITUMCC

+ (ITUMCC *)mccWithItems:(NSArray<NSString *> *)items {
    ITUMCC *mcc = [[ITUMCC alloc] init];
    mcc.mccCode = items[ITUMCCItemCode];
    return mcc;
}

- (NSMutableArray<ITUMNC *> *)mncsM {
    if(_mncsM) {
        return _mncsM;
    }
    
    _mncsM = [NSMutableArray array];
    return _mncsM;
}

- (NSArray<ITUMNC *> *)mncs {
    return [self.mncsM copy];
}

- (void)addMNC:(ITUMNC *)mnc {
    [self.mncsM addObject:mnc];
}

@end
