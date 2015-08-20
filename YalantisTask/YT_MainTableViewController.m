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

@interface YT_MainTableViewController ()

@property (nonatomic, strong) YT_SmileDAO * smileDAO;

@end

@implementation YT_MainTableViewController

#warning так как в этом методе вы ничего не кастомизируете, его можно удалить
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
#warning настройки работы контроллера привычнее видет во viewDidLoad. Если, допустим, у контроллера не будет Interface Builder представления, то этот метод не вызовется
    self.smileDAO = [[YT_SmileDAO alloc] init];
}

#pragma mark — Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    NSLog(@"tableView");
    return [self.smileDAO countSmiles];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView2");

#warning в требованиях я писал, что Вы должны реализовать кастомную ячейку, у которой будет метод вроде setupWithSmile:, в котором она будет заполнять себя моделью. Эту ячейку надо спроектировать с autolayout
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:
                             @"smileCell" forIndexPath:indexPath];
    YT_Smile * smile = [self.smileDAO getSmileAtIndex:indexPath.row];
    cell.textLabel.text = smile.name;
    cell.detailTextLabel.text = smile.desc;
    NSString *i = [NSString stringWithFormat:@"%d", smile.imageIndex];
    cell.imageView.image = [UIImage imageNamed:i];
    return cell;
}


@end
