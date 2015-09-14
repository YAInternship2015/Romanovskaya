//
//  YT_SmileTableViewCell.m
//  YalantisTask
//
//  Created by Бумбон on 25.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_SmileTableViewCell.h"
#import "YT_Smile.h"

@interface YT_SmileTableViewCell()

@property (nonatomic, weak) IBOutlet UIImageView *smileView;
@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *subtitle;
@property (nonatomic, weak) IBOutlet UILabel *glyph;


@end

@implementation YT_SmileTableViewCell

-(id)setupWithSmile:(YT_Smile *)smile {
    _title.text = smile.name;
    _subtitle.text = smile.desc;
    _glyph.text = smile.glyph;
    _smileView.image = smile.image;
    
    return self;

}

@end
