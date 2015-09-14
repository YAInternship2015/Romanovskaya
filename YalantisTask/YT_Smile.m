//
//  YT_Smile.m
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_Smile.h"
#import "UIKit/UIImage.h"

@implementation YT_Smile

-(id)initWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex glyph:(NSString *)glyph {
    
    self = [super init];
    if (self) {
        _name = name;
        _desc = desc;
        _glyph = glyph;
        
        if (imageIndex != 0){
            NSString *i = [NSString stringWithFormat:@"%d", imageIndex];
            UIImage *img = [UIImage imageNamed:i];
            _image = img;
        } else {
            _image = nil;
        }
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        _name = [dictionary valueForKey:@"name"];
        _desc = [dictionary valueForKey:@"desc"];
        _glyph = [dictionary valueForKey:@"glyph"];
        _image = nil;
        
    }
    return self;
}

@end
