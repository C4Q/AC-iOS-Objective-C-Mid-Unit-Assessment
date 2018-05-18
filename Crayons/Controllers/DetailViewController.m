//
//  DetailViewController.m
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()



@end

@implementation DetailViewController
double currentRed;
double currentGreen;
double currentBlue;
double currentAlpha = 1;
double originalAlpha = 1;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
   
}



- (IBAction)stepperPressed:(UIStepper *)sender {
    currentAlpha = sender.value;
    self.view.backgroundColor = [UIColor colorWithRed:currentRed green:currentGreen blue:currentBlue alpha:currentAlpha];
    _alphaLabel.text = [NSString stringWithFormat:@"alpha %f", currentAlpha];
}



-(void)setUp {
    currentRed = _crayon.redFloat;
    currentGreen = _crayon.greenFloat;
    currentBlue = _crayon.blueFLoat;
    _nameLabel.text = _crayon.name;
    _redLabel.text = [NSString stringWithFormat:@"red %f", currentRed];
    _greenLabel.text = [NSString stringWithFormat:@"green %f", currentGreen];
    _blueLabel.text = [NSString stringWithFormat:@"blue %f", currentBlue];
    _alphaLabel.text = [NSString stringWithFormat:@"alpha %f", currentAlpha];
    self.redSlider.value = currentRed;
    self.greenSlider.value = currentGreen;
    self.blueSlider.value = currentBlue;
    self.view.backgroundColor = [UIColor colorWithRed:currentRed green:currentGreen blue:currentBlue alpha:currentAlpha];
}




- (IBAction)sliderChanged:(UISlider *)sender {
    switch (sender.tag) {
        case 0:
            currentRed = sender.value;
            _redLabel.text = [NSString stringWithFormat:@"red %f", currentRed];
            break;
        case 1:
            currentGreen = sender.value;
            _greenLabel.text = [NSString stringWithFormat:@"green %f", currentGreen];
        case 2:
            currentBlue = sender.value;
            _blueLabel.text = [NSString stringWithFormat:@"blue %f", currentBlue];
        default:
            break;
    }
     self.view.backgroundColor = [UIColor colorWithRed:currentRed green:currentGreen blue:currentBlue alpha:currentAlpha];
}
- (void)resetPressed:(UIButton *)sender {
    [self setUp];
    currentAlpha = originalAlpha;
    self.stepper.value = currentAlpha;
    _alphaLabel.text = [NSString stringWithFormat:@"alpha %f", currentAlpha];
}
@end
