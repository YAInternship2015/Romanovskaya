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

-(void) initDefaultSmiles;

@end

@implementation YT_SmileDAO

-(id)init
{
    self = [super init];
    if (self) {
        _smiles = [[NSMutableArray alloc] init];
        [self initDefaultSmiles];
        NSLog(@"init smileDAO");
        return self;
    }
    return nil;
}

-(void)initDefaultSmiles
{
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:1];
    [self addSmileWithName:@"Surprise" description:@"Surprised smile" imageIndex:2];
    [self addSmileWithName:@"Shiny" description:@"Very happy smile" imageIndex:3];
    [self addSmileWithName:@"Winky" description:@"Winking smile" imageIndex:4];
    [self addSmileWithName:@"Cool" description:@"Cool smile" imageIndex:5];
    [self addSmileWithName:@"Teasy" description:@"Teasing smile" imageIndex:6];
    [self addSmileWithName:@"Puzzle" description:@"Puzzled smile" imageIndex:7];
    [self addSmileWithName:@"Sad" description:@"Sad smile" imageIndex:8];
    [self addSmileWithName:@"Weepy" description:@"Crying smile" imageIndex:9];
    [self addSmileWithName:@"Angry" description:@"Angry smile" imageIndex:10];
}

-(void)addSmileWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex
{
    YT_Smile * smile = [[YT_Smile alloc] initWithName:name description:desc imageIndex:imageIndex];
    [self.smiles addObject:smile];
}

-(YT_Smile *)getSmileAtIndex:(NSInteger)index
{
    NSLog(@"getSmileAtIndex");
    return [self.smiles objectAtIndex:index];
}

-(NSUInteger)countSmiles
{
    NSLog(@"countSmiles = %d", (int)[self.smiles count]);
    return [self.smiles count];
}

@end
