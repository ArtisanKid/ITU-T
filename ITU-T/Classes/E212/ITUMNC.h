//
//  ITUMNC.h
//  Pods
//
//  Created by 李翔宇 on 2017/8/22.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ITUMNCItem) {
    ITUMNCItemCode = 2,
    ITUMNCItemBrand,
    ITUMNCItemOperator,
    ITUMNCItemState,
    ITUMNCItemMHz,
    ITUMNCItemReference
};

@interface ITUMNC : NSObject

@property (nonatomic, strong, readonly) NSString *mncCode;
@property (nonatomic, strong, readonly) NSString *brand;/**<品牌*/
@property (nonatomic, strong, readonly) NSString *operato;/**<运营商*/
@property (nonatomic, strong, readonly) NSString *state;/**<状态*/
@property (nonatomic, strong, readonly) NSString *MHz;/**<频段*/
@property (nonatomic, strong, readonly) NSString *reference;/**<参考注释*/

+ (ITUMNC *)mncWithItems:(NSArray<NSString *> *)items;

@end
