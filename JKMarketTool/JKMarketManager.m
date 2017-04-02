//
//  MarketManager.m
//  MT
//
//  Created by jianjie on 16/6/24.
//  Copyright © 2016年 jianjie. All rights reserved.
//

#import "JKMarketManager.h"
#import "sys/utsname.h"
#import <objc/runtime.h>

static NSString      *_deviceName;

@interface JKMarketManager ()

@end

@implementation JKMarketManager

static id _showJKMarketManagerInstance;
+ (instancetype)showJKMarketManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _showJKMarketManagerInstance = [[[self class] alloc] init];
    });
    return _showJKMarketManagerInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _deviceName = [self getIphoeXH:[self getCurrentDevice]];
    }
    return self;
}

- (CGFloat)translationSize:(CGFloat)pxSize marketSizeType:(JKMarketSizeType)marketSizeType {
    CGFloat newPxSize = pxSize/2.0;
    CGFloat translationSize = 0;
    CGFloat marketSize = [self getSizeWithMarketSizeType:marketSizeType];
    
    if ([[UIScreen mainScreen] bounds].size.width == JKDefule4PhoneWidth)
    {
        if ([_deviceName isEqualToString:@"iPhone 4"]||[_deviceName isEqualToString:@"iPhone 5"])
        {
            translationSize = JKDefule4PhoneWidth/marketSize*newPxSize;
        }
        else
        {
            //放大模式(暂未考虑)
            translationSize = JKDefule4PhoneWidth/marketSize*newPxSize*EnlargingScale;
        }
    }
    
    if ([[UIScreen mainScreen] bounds].size.width == JKDefule6PhoneWidth)
    {
        if ([_deviceName isEqualToString:@"iPhone 6"])
        {
            translationSize = JKDefule6PhoneWidth/marketSize*newPxSize;
        }
        else
        {
            //放大模式(暂未考虑)
            translationSize = JKDefule6PhoneWidth/marketSize*newPxSize*EnlargingScale;
        }
    }
    
    if ([[UIScreen mainScreen] bounds].size.width == JKDefule6PlusPhoneWidth)
    {
        if ([_deviceName isEqualToString:@"iPhone 6 Plus"])
        {
            translationSize = JKDefule6PlusPhoneWidth/marketSize*newPxSize;
        }
        else
        {
            //放大模式(暂未考虑)
            translationSize = JKDefule6PlusPhoneWidth/marketSize*newPxSize*EnlargingScale;
        }
    }
    return translationSize;
}

- (CGFloat)translationSize:(CGFloat)pxSize
{
    return [self translationSize:pxSize marketSizeType:DefuleWidth];
}

//获得设备型号
- (NSString *)getCurrentDevice
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone8,3"]) return @"iPhoneSE";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhoneSE";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6sPlus";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone7Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

- (NSString *)getIphoeXH:(NSString *)platform
{
    if ([platform hasPrefix:@"iPhone 4"])
    {
        return @"iPhone 4";
    }
    else if([platform hasPrefix:@"iPhone 5"] || [platform hasPrefix:@"iPhoneSE"])
    {
        return @"iPhone 5";
    }
    else if([platform hasPrefix:@"iPhone 6 Plus"] || [platform hasPrefix:@"iPhone6sPlus"] || [platform hasPrefix:@"iPhone7Plus"])
    {
        return @"iPhone 6 Plus";
    }
    else
    {
        return @"iPhone 6";
    }
}

- (CGFloat)getSizeWithMarketSizeType:(JKMarketSizeType)marketSizeType {
    CGFloat size = 0;
    switch (marketSizeType) {
        case JKMarketSizeTypeFour:
        {
            size = JKDefule4PhoneWidth;
        }
            break;
        case JKMarketSizeTypeSix:
        {
            size = JKDefule6PhoneWidth;
        }
            break;
        case JKMarketSizeTypePlus:
        {
            size = JKDefule6PlusPhoneWidth;
        }
            break;
        default:
            break;
    }
    return size;
}

@end
