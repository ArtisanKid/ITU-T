//
//  ITUCountry.m
//  Pods
//
//  Created by 李翔宇 on 2017/8/22.
//
//

#import "ITUCountry.h"
#import <ISO3166/ISOCountry.h>
#import "ITUE212Macros.h"

typedef NS_ENUM(NSUInteger, ITUCountryItem) {
    ITUCountryItemCode,
};

@interface ITUCountry ()

@property (nonatomic, strong) NSString *code;/**<二位字母代码*/
@property (nonatomic, strong) NSString *code3;/**<三位字母代码*/
@property (nonatomic, strong) NSString *number;/**<二位数字代码*/
@property (nonatomic, strong) NSString *cName;/**<中文国家名称*/
@property (nonatomic, strong) NSString *eName;/**<英文国家名称*/

@property (nonatomic, strong) NSMutableArray<ITUMCC *> *mccsM;

@end

@implementation ITUCountry

+ (NSArray<ITUCountry *> *)countries {
    static NSMutableArray<ITUCountry *> *sharedInstances = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstances = [NSMutableArray array];
        
        NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
        NSString *path = [currentBundle pathForResource:@"ITU移动设备信息" ofType:@"txt"];
        
        NSError *error = nil;
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
        if(!content.length) {
            if(error) {
                ITUE212Log(@"%@", error);
            }
        }
        
        NSArray<NSString *> *components = [content componentsSeparatedByString:@"\n"];
        for(NSString *component in components) {
            NSArray<NSString *> *items = [component componentsSeparatedByString:@":"];
            
            if(items.count < 8) {
                continue;
            }
            
            NSString *code = items[ITUCountryItemCode];
            if(![sharedInstances.lastObject.code isEqualToString:code]) {
                ISOCountry *_country = [ISOCountry countryOfCode:code];
                
                ITUCountry *country = [[ITUCountry alloc] init];
                if(_country) {
                    country.code = _country.code;
                    country.code3 = _country.code3;
                    country.number = _country.number;
                    country.cName = _country.cName;
                    country.eName = _country.eName;
                } else {
                    country.code = code;
                }
                
                [sharedInstances addObject:country];
            }
            
            ITUCountry *country = sharedInstances.lastObject;
            
            NSString *mccCode = items[ITUMCCItemCode];
            if(![country.mccsM.lastObject.mccCode isEqualToString:mccCode]) {
                ITUMCC *mcc = [ITUMCC mccWithItems:items];
                [sharedInstances.lastObject.mccsM addObject:mcc];
            }
            
            ITUMCC *mcc = country.mccsM.lastObject;
            
            ITUMNC *mnc = [ITUMNC mncWithItems:items];
            [mcc addMNC:mnc];
        }
    });
    return [sharedInstances copy];
}

- (NSMutableArray<ITUMCC *> *)mccsM {
    if(_mccsM) {
        return _mccsM;
    }
    
    _mccsM = [NSMutableArray array];
    return _mccsM;
}

- (NSArray<ITUMCC *> *)mccs {
    return [self.mccsM copy];
}

@end
