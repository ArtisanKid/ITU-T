//
//  ITUCountry.h
//  Pods
//
//  Created by 李翔宇 on 2017/8/22.
//
//

#import <Foundation/Foundation.h>
#import "ITUMCC.h"

@interface ITUCountry : NSObject

@property (nonatomic, strong, readonly) NSString *code;/**<二位字母代码*/
@property (nonatomic, strong, readonly) NSString *code3;/**<三位字母代码*/
@property (nonatomic, strong, readonly) NSString *number;/**<二位数字代码*/
@property (nonatomic, strong, readonly) NSString *cName;/**<中文国家名称*/
@property (nonatomic, strong, readonly) NSString *eName;/**<英文国家名称*/

@property (nonatomic, strong, readonly) NSArray<ITUMCC *> *mccs;

+ (NSArray<ITUCountry *> *)countries;

@end
