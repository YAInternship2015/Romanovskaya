//
//  YT_SmileDAO.m
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_SmileDAO.h"
#import "YT_Smile.h"

@interface YT_SmileDAO ()

@property (nonatomic, readonly) NSMutableArray *smiles;

- (void)initDefaultSmiles;

@end

@implementation YT_SmileDAO

- (id)init {
    
    self = [super init];
    if (self) {
        _smiles = [[NSMutableArray alloc] init];
        [self initDefaultSmiles];
        NSLog(@"init smileDAO");
        return self;
    }
    return nil;
}

- (void)initDefaultSmiles {
 
    NSString *pathToPlist = [[NSBundle mainBundle] pathForResource:@"SmileList" ofType:@"plist"];
    NSArray *smileList = [NSArray arrayWithContentsOfFile:pathToPlist];
    for (NSDictionary *smile in smileList){
        [self addSmileWithName:smile[@"name"] description:smile[@"description"] imageIndex:[smile[@"imageIndex"] intValue] glyph:smile[@"glyph"]];
    }
}

- (void)addSmileWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex glyph:(NSString *)glyph {
    
    YT_Smile * smile = [[YT_Smile alloc] initWithName:name description:desc imageIndex:imageIndex glyph:glyph];
    [self.smiles addObject:smile];
}

- (YT_Smile *)smileAtIndex:(NSInteger)index {
    
    NSLog(@"getSmileAtIndex");
    return [self.smiles objectAtIndex:index];
}

- (NSUInteger)countSmiles {
    
    NSLog(@"countSmiles = %d", (int)[self.smiles count]);
    return [self.smiles count];
}

@end
