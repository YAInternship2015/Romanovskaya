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
{
    self = [super init];
    if (self) {
        _name = name;
        _desc = desc;
        _imageIndex = imageIndex;
        
        NSLog(@"init smile");
        return self;
    }
    return nil;
}

@end
