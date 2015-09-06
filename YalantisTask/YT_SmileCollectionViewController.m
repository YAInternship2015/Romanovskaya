//
//  YT_SmileCollectionViewController.m
//  YalantisTask
//
//  Created by Бумбон on 02.09.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_SmileCollectionViewController.h"
#import "YT_SmileDAO.h"
#import "YT_SmileCollectionViewCell.h"
#import "YT_Smile.h"

@interface YT_SmileCollectionViewController ()

@property (nonatomic, strong) YT_SmileDAO * smileDAO;

@end

@implementation YT_SmileCollectionViewController

static NSString * const reuseIdentifier = @"Smile Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
        UICollectionViewLayout *layout = [self flowLayout];

    [self.collectionView setCollectionViewLayout:layout];
    [self.collectionView registerClass:[YT_SmileCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.smileDAO = [[YT_SmileDAO alloc] init];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"Collection view will appear");
    self.smileDAO = [[YT_SmileDAO alloc] init];
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.smileDAO countSmiles];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(reuseIdentifier);
    
    YT_SmileCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    YT_Smile * smile = [self.smileDAO smileAtIndex:indexPath.row];
    
    NSString *i = [NSString stringWithFormat:@"%d", smile.imageIndex];
    UIImage *image = [UIImage imageNamed:i];
    cell.smileView.image = image;
    
    return cell;
}

- (UICollectionViewFlowLayout *)flowLayout{
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc] init];
    NSLog(@"init flowLayout");
    
    fl.minimumLineSpacing = 20.0f;
    fl.itemSize = CGSizeMake(40.0f, 40.0f);
    fl.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    fl.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    fl.minimumInteritemSpacing = 10.0f;
    
    return fl;
    
}





#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
