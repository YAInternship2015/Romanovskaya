//
//  YT_Smile.h
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning Глобальное замечание - префикс приложения пишется слитно с именем класса, то есть не YT_Smile, а YTSmile. Это касается всех классов

@interface YT_Smile : NSObject

#warning не стоит в *.h файле показывать readwrite свойства, так их может кто угодно изменить извне. В *.h объявите эти свойства как readonly, а в *.m - readwrite
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
#warning логиченее было бы хранить сам UIImage, а не индекс
@property (nonatomic, assign) int imageIndex;

#warning также довольно часто повторяющаяся у Вас ошибка - ошиблись в форматировании - (id)initWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex;
-(id) initWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex;

@end
