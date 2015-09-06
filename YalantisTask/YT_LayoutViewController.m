//
//  YT_LayoutViewController.m
//  YalantisTask
//
//  Created by Бумбон on 06.09.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_LayoutViewController.h"

@interface YT_LayoutViewController ()

@property (strong, nonatomic) UIViewController * tableViewController;
@property (strong, nonatomic) UIViewController * collectionViewController;

@property (strong, nonatomic) UIViewController * currentViewController;

@property (weak, nonatomic) IBOutlet UIView *container;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *layoutSwitch;

@end

@implementation YT_LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tableViewController  = [storyBoard instantiateViewControllerWithIdentifier:@"TableViewController"];
    self.collectionViewController = [storyBoard instantiateViewControllerWithIdentifier:@"CollectionViewController"];
    
    [self displayViewController:self.tableViewController];
    self.layoutSwitch.title = @"Collection";
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewVillAppear");
    
}

- (IBAction)pressLayoutButton:(UIBarButtonItem *)sender {
    if (self.currentViewController == self.tableViewController) {
        [self changeLayoutViewTo:self.collectionViewController];
        self.layoutSwitch.title = @"Table";

    } else {
        [self changeLayoutViewTo:self.tableViewController];
        self.layoutSwitch.title = @"Collection";
    }
}

- (void) changeLayoutViewTo:(UIViewController *) vc{
    if (self.currentViewController != nil) {
        [self removeViewController:self.currentViewController];
        [self displayViewController:vc];
    } else {
        [self displayViewController:vc];
    }
}

- (void) displayViewController:(UIViewController *) vc{
    [self addChildViewController:vc];
    vc.view.frame = self.container.frame;
    [self.container addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    
    self.currentViewController = vc;
}

- (void) removeViewController:(UIViewController *) vc {
    [vc willMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
    
    self.currentViewController = nil;
}



@end
