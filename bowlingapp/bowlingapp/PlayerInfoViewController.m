//
//  PlayerInfoViewController.m
//  bowlingapp
//
//  Created by Hashim Shafique on 11/18/14.
//  Copyright (c) 2014 Hashim Shafique. All rights reserved.
//

#import "PlayerInfoViewController.h"

@interface PlayerInfoViewController () <UITextFieldDelegate>
- (IBAction)finishedEnteringName:(id)sender;

@end

@implementation PlayerInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)finishedEnteringName:(id)sender
{
    UITextField *name = (UITextField *)sender;
    [name resignFirstResponder];
}

@end
