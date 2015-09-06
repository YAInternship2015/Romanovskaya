//
//  YT_AddSmileViewController.m
//  YalantisTask
//
//  Created by Бумбон on 27.08.15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "YT_AddSmileViewController.h"
#import "YT_Smile.h"
#import "YT_SmileDAO.h"

@interface YT_AddSmileViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *descField;
@property (weak, nonatomic) IBOutlet UITextField *glyphField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (weak, nonatomic) UITextField *currentlyEditedField;

@property (strong, nonatomic) YT_SmileDAO *smileDao;
@property (strong, nonatomic) NSMutableDictionary *smileDTO;

@end

@implementation YT_AddSmileViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"View Did Load");
    self.smileDao = [[YT_SmileDAO alloc] init];
    [self.saveButton setEnabled:NO];
    self.errorLabel.text = @"";
    self.smileDTO = [[NSMutableDictionary alloc]initWithObjects:@[@"", @"", @""] forKeys:@[@"name", @"desc", @"glyph"]];
    self.currentlyEditedField = NULL;
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"View will appear");
}

- (IBAction)tapOnView:(UITapGestureRecognizer *)sender {
    if (self.currentlyEditedField != NULL) {
        [self textFieldShouldReturn:self.currentlyEditedField];
        self.currentlyEditedField = NULL;
    } else {
        self.errorLabel.text = @"";
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (IBAction)pressSaveButton:(UIBarButtonItem *)sender {
    if (self.currentlyEditedField != nil) {
        if (![self textFieldShouldEndEditing:self.currentlyEditedField]) {
            return;
        }
    } else if ([self validateSmile]) {
        [self addNewSmileFromDTO:self.smileDTO];
        self.errorLabel.text = [[self.smileDTO valueForKey:@"glyph"] stringByAppendingString:@" added"];
        [self emptyDTO:self.smileDTO];
        [self emptyFields];
    }
    
    [self.saveButton setEnabled:false];
}

- (void)addNewSmileFromDTO:(NSDictionary *)smileDTO {
    YT_Smile *smile = [[YT_Smile alloc] initWithName:[smileDTO valueForKey:@"name"] description:[smileDTO valueForKey:@"desc"] imageIndex:0 glyph:[smileDTO valueForKey:@"glyph"]];
    [self.smileDao saveSmile:smile];
    
}

#pragma mark - Text Editing

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.errorLabel.text = @"";
    self.currentlyEditedField = textField;
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    BOOL flag = false;
    NSString * txt = textField.text;
    
    if (textField == self.nameField) {
        if (([txt length] > 2 & [txt length] < 12) | [txt isEqualToString:@""]) {
            [self.smileDTO setObject:txt forKey:@"name"];
            flag = true;
        } else {
            self.errorLabel.text = @"The name should be from 3 to 11 symbools";
        }
    }
    
    if (textField == self.descField) {
        if (([txt length] < 30) | [txt isEqualToString:@""]) {
            [self.smileDTO setObject:txt forKey:@"desc"];
            flag = true;
        } else {
            self.errorLabel.text = @"The description should be up to 30 symbools";
        }
    }
    
    if (textField == self.glyphField) {
        if (([txt length] > 1 & [txt length] < 5) | [txt isEqualToString:@""]) {
            [self.smileDTO setObject:txt forKey:@"glyph"];
            flag = true;
        } else {
            self.errorLabel.text = @"The glyph should be 2 to 4 symbools";
        }
    }
    
    if ([self validateSmile]) {
        [self.saveButton setEnabled:true];
    } else {
        [self.saveButton setEnabled:false];
    }
    
    return flag;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (BOOL) validateSmile {
    if (![[self.smileDTO valueForKey:@"name"] isEqualToString:@""] ) {
        if (![[self.smileDTO valueForKey:@"glyph"] isEqualToString:@""] ) {
            return true;
        }
    }
    return false;
}

- (void) emptyDTO:(NSMutableDictionary *)dto{
    for (NSString *key in [dto allKeys]) {
        [dto setObject:@"" forKey:key];
    }
}

- (void)emptyFields{
    self.nameField.text = @"";
    self.descField.text = @"";
    self.glyphField.text = @"";
}


@end
