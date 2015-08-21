//
//  YT_SmileDAO.h
//  YalantisTask
//
//  Created by Бумбон on 18.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YT_Smile;

@interface YT_SmileDAO : NSObject

-(NSUInteger) countSmiles;

-(YT_Smile *) getSmileAtIndex:(NSInteger)index;

-(void) addSmileWithName:(NSString *)name description:(NSString *)desc imageIndex:(int) imageIndex;

@end
