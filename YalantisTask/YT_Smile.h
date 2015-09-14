//
//  YT_Smile.h
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;

@interface YT_Smile : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *desc;
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, copy, readonly) NSString *glyph;

- (id)initWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex glyph:(NSString *)glyph;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
