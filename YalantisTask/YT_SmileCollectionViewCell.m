//
//  YT_SmileCollectionViewCell.m
//  YalantisTask
//
//  Created by Бумбон on 02.09.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_SmileCollectionViewCell.h"
#import "YT_Smile.h"

@interface YT_SmileCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *smileView;

@end

@implementation YT_SmileCollectionViewCell

-(id)setupWitSmile:(YT_Smile *)smile {
    
    _smileView.image = smile.image;
    
    return self;

}

@end
