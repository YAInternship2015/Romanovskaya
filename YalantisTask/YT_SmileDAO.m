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
@property (nonatomic, readonly) NSString *pathToPlist;

- (void)initDefaultSmiles;

@end

@implementation YT_SmileDAO

- (id)init {
    
    self = [super init];
    if (self) {
        _smiles = [[NSMutableArray alloc] init];
        _pathToPlist = [[NSBundle mainBundle] pathForResource:@"SmileList" ofType:@"plist"];
        [self initDefaultSmiles];
        return self;
    }
    return nil;
}

- (void)initDefaultSmiles {
 
    NSArray *smileList = [NSArray arrayWithContentsOfFile:self.pathToPlist];
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

- (void) saveSmile:(YT_Smile *)smile {
    [self.smiles addObject:smile];
    NSMutableArray *smileList = [[NSMutableArray arrayWithContentsOfFile:self.pathToPlist] mutableCopy];
    NSDictionary *smileDTO = [[NSDictionary alloc]
                              initWithObjects:@[smile.name, smile.desc, [NSNumber numberWithInt:smile.imageIndex], smile.glyph]
                              forKeys:@[@"name", @"description", @"imageIndex", @"glyph"]];
    
    [smileList addObject:smileDTO];
    [smileList writeToFile:self.pathToPlist atomically:YES];
    NSLog(@"Save Smile");
}

@end
