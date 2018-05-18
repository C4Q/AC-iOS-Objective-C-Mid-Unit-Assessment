//
//  ColorDetailViewController.m
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "ColorDetailViewController.h"

@interface ColorDetailViewController ()

@end

@implementation ColorDetailViewController

-(instancetype)initWithColor:(Crayon *)color {
    self = [super init];
    if (self) {
        _color = color;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setOriginalState];
}

-(void)setOriginalState {
    [self setInitialBackgroundColor];
    self.colorName.text = [self color].name;
    
    if ([self.color.name isEqual: @"Black"]) {
        self.colorName.textColor = UIColor.whiteColor;
        self.redLabel.textColor = UIColor.whiteColor;
        self.greenLabel.textColor = UIColor.whiteColor;
        self.blueLabel.textColor = UIColor.whiteColor;
        self.alphaLabel.textColor = UIColor.whiteColor;
    }
    
    self.redLabel.text = [[NSString alloc] initWithFormat:@"%f", self.redSlider.value];
    self.greenLabel.text = [[NSString alloc] initWithFormat:@"%f", self.greenSlider.value];
    self.blueLabel.text = [[NSString alloc] initWithFormat:@"%f", self.blueSlider.value];
    self.alphaLabel.text = [[NSString alloc] initWithFormat:@"%f", self.alphaStepper.value];
}

-(void)setInitialBackgroundColor {
    self.view.backgroundColor = [UIColor colorWithRed:self.color.red/255 green:self.color.green/255 blue:self.color.blue/255 alpha:1.0];
    
    self.currentRed = [self color].red/255;
    self.currentGreen = [self color].green/255;
    self.currentBlue = [self color].blue/255;
    self.currentAlpha = 1.0;
    
    self.redSlider.value = self.currentRed;
    self.greenSlider.value = self.currentGreen;
    self.blueSlider.value = self.currentBlue;
    self.alphaStepper.value = self.currentAlpha;
}

-(void)changeRed:(id)sender {
    UISlider *slider = (UISlider*)sender;
    self.currentRed = slider.value;
    self.redLabel.text = [[NSString alloc] initWithFormat:@"%f", self.redSlider.value];
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaStepper.value];
}

-(void)changeGreen:(id)sender {
    UISlider *slider = (UISlider*)sender;
    self.currentGreen = slider.value;
    self.greenLabel.text = [[NSString alloc] initWithFormat:@"%f", self.greenSlider.value];
        self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaStepper.value];
}

-(void)changeBlue:(id)sender {
    UISlider *slider = (UISlider*)sender;
    self.currentBlue = slider.value;
    self.blueLabel.text = [[NSString alloc] initWithFormat:@"%f", self.blueSlider.value];
        self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaStepper.value];
}

-(void)changeAlpha:(id)sender {
    UIStepper *stepper = (UIStepper*)sender;
    self.currentAlpha = stepper.value;
    self.alphaLabel.text = [[NSString alloc] initWithFormat:@"%f", self.alphaStepper.value];
        self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaStepper.value];
}

-(void)resetColor:(id)sender {
    [self setOriginalState];
}





@end
