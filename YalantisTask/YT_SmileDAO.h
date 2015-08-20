//
//  YT_SmileDAO.h
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YT_Smile;

@interface YT_SmileDAO : NSObject

#warning более "говорящее" название - countOfSmiles
-(NSUInteger) countSmiles;

#warning в obj-c в так называемых мгновенных геттерах не пишется слово "get". Просто smileAtIndex:. Если бы геттер был так сказать длительным, например, лез бы в сеть за данными, то в начало имени метода добавилось бы слово "request", "load" или вроде того
-(YT_Smile *) getSmileAtIndex:(NSInteger)index;

#warning форматирование! - (void)addSmileWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex;
-(void) addSmileWithName:(NSString *)name description:(NSString *)desc imageIndex:(int) imageIndex;

@end
