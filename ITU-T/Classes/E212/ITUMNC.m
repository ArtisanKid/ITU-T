//
//  ITUMNC.m
//  Pods
//
//  Created by 李翔宇 on 2017/8/22.
//
//

#import "ITUMNC.h"

@interface ITUMNC ()

@property (nonatomic, strong) NSString *mncCode;
@property (nonatomic, strong) NSString *brand;/**<品牌*/
@property (nonatomic, strong) NSString *operato;/**<运营商*/
@property (nonatomic, strong) NSString *state;/**<状态*/
@property (nonatomic, strong) NSString *MHz;/**<频段*/
@property (nonatomic, strong) NSString *reference;/**<参考注释*/

@end

@implementation ITUMNC

+ (ITUMNC *)mncWithItems:(NSArray<NSString *> *)items {
    ITUMNC *mnc = [[ITUMNC alloc] init];
    mnc.mncCode = items[ITUMNCItemCode];
    mnc.brand = items[ITUMNCItemBrand];
    mnc.operato = items[ITUMNCItemOperator];
    mnc.state = items[ITUMNCItemState];
    mnc.MHz = items[ITUMNCItemMHz];
    mnc.reference = items[ITUMNCItemReference];
    return mnc;
}

@end
