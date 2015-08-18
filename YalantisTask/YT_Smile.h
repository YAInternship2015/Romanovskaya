//
//  YT_Smile.h
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YT_Smile : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) int imageIndex;

-(id) initWithName:(NSString *)name description:(NSString *)desc imageIndex:(int)imageIndex;

@end
