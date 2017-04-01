//
//  JKMarketDefines.h
//  JKMarketTool
//
//  Created by Jackie on 2017/3/31.
//  Copyright © 2017年 Jockie. All rights reserved.
//

#ifndef JKMarketDefine_h
#define JKMarketDefine_h

#pragma mark - configuration(配置)

//默认的设计尺寸(默认为6的尺寸)
#define DefuleWidth JKMarketSizeTypeSix

//放大模式下的 放大比例
#define EnlargingScale 1.0

#pragma mark - define(定义)

typedef enum : NSUInteger {
    JKMarketSizeTypeFour,
    JKMarketSizeTypeSix,
    JKMarketSizeTypePlus
} JKMarketSizeType;

//各个机型默认宽度大小
#define JKDefule4PhoneWidth     320.0
#define JKDefule6PhoneWidth     375.0
#define JKDefule6PlusPhoneWidth 414.0

//传入一个px尺寸  输出一个按照屏幕适配的尺寸(默认尺寸)
#define __KNewSize(pxSize) [[JKMarketManager showJKMarketManager]translationSize:pxSize]

// 4,5.(320)
#define __KNewSizeFour(pxSize) [[JKMarketManager showJKMarketManager]translationSize:pxSize marketSizeType:JKMarketSizeTypeFour]

// 6.(375)
#define __KNewSizeSix(pxSize) [[JKMarketManager showJKMarketManager]translationSize:pxSize marketSizeType:JKMarketSizeTypeSix]

// plus.(414)
#define __KNewSizePlus(pxSize) [[JKMarketManager showJKMarketManager]translationSize:pxSize marketSizeType:JKMarketSizeTypePlus]

#endif /* JKMarketDefines_h */
