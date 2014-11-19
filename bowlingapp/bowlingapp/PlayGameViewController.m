//
//  PlayGameViewController.m
//  bowlingapp
//
//  Created by Hashim Shafique on 11/18/14.
//  Copyright (c) 2014 Hashim Shafique. All rights reserved.
//

#import "PlayGameViewController.h"

@interface PlayGameViewController ()
- (IBAction)onBowlingBowlSpin:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *pin1;
@property (weak, nonatomic) IBOutlet UIImageView *pin2;
@property (weak, nonatomic) IBOutlet UIImageView *pin3;
@property (weak, nonatomic) IBOutlet UIImageView *pin4;
@property (weak, nonatomic) IBOutlet UIImageView *pin5;
@property (weak, nonatomic) IBOutlet UIImageView *pin6;
@property (weak, nonatomic) IBOutlet UIImageView *pin7;
@property (weak, nonatomic) IBOutlet UIImageView *pin8;
@property (weak, nonatomic) IBOutlet UIImageView *pin9;
@property (weak, nonatomic) IBOutlet UIImageView *pin10;
@property (strong, nonatomic) NSArray *listOfpins;
@property (weak, nonatomic) IBOutlet UILabel *currentScore;
@property (nonatomic) int state;
@property (nonatomic) int sumFromSpin1;
@end

@implementation PlayGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listOfpins = @[self.pin1, self.pin2, self.pin3, self.pin4, self.pin5, self.pin6, self.pin7, self.pin8, self.pin9, self.pin10];
    self.state = 0;
    self.currentScore.text = @"0";
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

- (IBAction)onBowlingBowlSpin:(id)sender
{
    int randomnumber = arc4random() % 10;
    NSLog(@"random number is %d", randomnumber);
    int frameScore;
    if (self.state == 0)
    {
        for (int i=0;i<randomnumber;i++)
        {
            UIImageView *tmpView = self.listOfpins[i];
            tmpView.hidden = true;
        }
        self.sumFromSpin1 = randomnumber;
        self.state = 1;
    }
    else if (self.state == 1)
    {
        for (int i=self.sumFromSpin1;i < 10 && i < self.sumFromSpin1 + randomnumber;i++)
        {
            UIImageView *tmpView = self.listOfpins[i];
            tmpView.hidden = true;
        }
        self.state = 0;
        frameScore = (self.sumFromSpin1 + randomnumber) > 10 ? 10 : (self.sumFromSpin1 + randomnumber);

        //
        frameScore += [self.currentScore.text intValue];

        self.currentScore.text = [NSString stringWithFormat:@"%d", frameScore];

    }


}
@end
