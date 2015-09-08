//
//  YT_Smile.h
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YT_Smile : NSObject

#warning не нужно в *.h файле показывать readwrite свойства. В *.h достаточно показать readonly доступ, а уже в *.m - readwrite
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) int imageIndex;
@property (nonatomic, copy) NSString *glyph;

- (id)initWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex glyph:(NSString *)glyph;

@end
