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
        [self initDefaultSmiles];
        return self;
    }
    return nil;
}

-(void)initDefaultSmiles
{
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:1];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:2];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:3];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:4];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:5];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:6];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:7];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:8];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:9];
    [self addSmileWithName:@"Happy" description:@"Happy smile" imageIndex:10];
}

-(void)addSmileWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex
{
    YT_Smile * smile = [[YT_Smile alloc] initWithName:name description:desc imageIndex:imageIndex];
    [self.smiles addObject:smile];
}

-(YT_Smile *)getSmileAtIndex:(NSUInteger)index
{
    return [self.smiles objectAtIndex:index];
}

-(NSUInteger)countSmiles
{
    return [self.smiles count];
}

@end
