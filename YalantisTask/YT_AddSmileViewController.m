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

- (IBAction)tapOnView:(UITapGestureRecognizer *)sender {
    if (self.currentlyEditedField != NULL) {
        [self textFieldShouldReturn:self.currentlyEditedField];
        self.currentlyEditedField = NULL;
    } else {
        self.errorLabel.text = @"";
    }
}

#pragma mark - Navigation
- (IBAction)pressSaveButton:(UIBarButtonItem *)sender {
    if (self.currentlyEditedField != nil) {
        if (![self textFieldShouldEndEditing:self.currentlyEditedField]) {
            return;
        }
    } else if ([self validateSmile]) {
        [self addNewSmileFromDTO:self.smileDTO];
        self.errorLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Smile '%@' added", nil), [self.smileDTO valueForKey:@"glyph"]];

        [self emptyDTO:self.smileDTO];
        [self emptyFields];
    }
    
    [self.saveButton setEnabled:false];
}

- (void)addNewSmileFromDTO:(NSDictionary *)smileDTO {
    
    [self.smileDao saveSmile:[[YT_Smile alloc] initWithDictionary:smileDTO]];
    
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
    
#warning вся валидация должна быть раскидана в объйкты-валидаторы, по одному объекту на одно поле
    
    if (textField == self.nameField) {
        if (([txt length] > 2 & [txt length] < 12) | [txt isEqualToString:@""]) {
            [self.smileDTO setObject:txt forKey:@"name"];
            flag = true;
        } else {
            self.errorLabel.text = NSLocalizedString(@"The name should be from 3 to 11 symbools", nil);
        }
    }
    
    if (textField == self.descField) {
        if (([txt length] < 30) | [txt isEqualToString:@""]) {
            [self.smileDTO setObject:txt forKey:@"desc"];
            flag = true;
        } else {
            self.errorLabel.text = NSLocalizedString(@"The description should be up to 30 symbools", nil);
        }
    }
    
    if (textField == self.glyphField) {
        if (([txt length] > 1 & [txt length] < 5) | [txt isEqualToString:@""]) {
            [self.smileDTO setObject:txt forKey:@"glyph"];
            flag = true;
        } else {
            self.errorLabel.text = NSLocalizedString(@"The glyph should be 2 to 4 symbools", nil);
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
