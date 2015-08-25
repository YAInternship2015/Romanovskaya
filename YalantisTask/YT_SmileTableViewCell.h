//
//  YT_SmileTableViewCell.h
//  YalantisTask
//
//  Created by Бумбон on 25.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YT_SmileTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *smileView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *glyph;

@end
