//
//  YT_MainTableViewController.m
//  YalantisTask
//
//  Created by Бумбон on 19.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_MainTableViewController.h"
#import "YT_SmileDAO.h"
#import "YT_Smile.h"
#import "YT_SmileTableViewCell.h"

@interface YT_MainTableViewController ()

@property (nonatomic, strong) YT_SmileDAO * smileDAO;

@end

@implementation YT_MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"awake from nib");
    self.smileDAO = [[YT_SmileDAO alloc] init];
}

#pragma mark — Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return [self.smileDAO countSmiles];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YT_SmileTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:
                             @"smileCell" forIndexPath:indexPath];
    YT_Smile * smile = [self.smileDAO getSmileAtIndex:indexPath.row];
    cell.title.text = smile.name;
    cell.subtitle.text = smile.desc;
    cell.glyph.text = smile.glyph;
    NSString *i = [NSString stringWithFormat:@"%d", smile.imageIndex];
    UIImage *image = [UIImage imageNamed:i];
    cell.smileView.image = image;
    return cell;
}


@end
