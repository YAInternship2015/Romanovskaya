//
//  YT_Smile.m
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_Smile.h"

@implementation YT_Smile

-(id)initWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex
#warning открывающуюся скобку оставляйте на той же строке, что и имя метода. Исправьте по всему приложению
{
    self = [super init];
    if (self) {
        _name = name;
        _desc = desc;
        _imageIndex = imageIndex;
        
        NSLog(@"init smile");
#warning этот return здесь лишний. Достаточно в последнем return вернуть self. Исправьте это по всему приложению
        return self;
    }
    return nil;
}

@end
