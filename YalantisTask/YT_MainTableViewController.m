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
    self.smileDAO = [[YT_SmileDAO alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"Table view will appear");
    self.smileDAO = [[YT_SmileDAO alloc] init];
    [self.tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark — Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    return [self.smileDAO countSmiles];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YT_SmileTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:
                             @"smileCell" forIndexPath:indexPath];
    YT_Smile * smile = [self.smileDAO smileAtIndex:indexPath.row];
    
    cell.title.text = smile.name;
    cell.subtitle.text = smile.desc;
    cell.glyph.text = smile.glyph;
    
    if (smile.imageIndex != 0){
        NSString *i = [NSString stringWithFormat:@"%d", smile.imageIndex];
        UIImage *image = [UIImage imageNamed:i];
        cell.smileView.image = image;
    } else {
        cell.smileView.image = NULL;
    }
    
    return cell;
}


@end
