//
//  detailViewController.m
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "detailViewController.h"
#import "Crayon.h"

@interface detailViewController ()

@end

@implementation detailViewController
Crayon *currentCrayonConfig;
double currentAlpha = 1.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    currentCrayonConfig = [[Crayon alloc] initWithName:_currentCrayon.name red:_currentCrayon.red/255 green:_currentCrayon.green/255 blue:_currentCrayon.blue/255 hex:_currentCrayon.hex];
    [self setUp];
}


- (void)setUp {
    self.crayonTitle.text = [currentCrayonConfig name];
    self.redLabel.text = [NSString stringWithFormat:@"%f", currentCrayonConfig.red];
    self.greenLabel.text = [NSString stringWithFormat:@"%f", currentCrayonConfig.green];
    self.blueLable.text = [NSString stringWithFormat:@"%f", currentCrayonConfig.blue];
    self.alphaLabel.text = [NSString stringWithFormat:@"%f", currentAlpha];
    self.redSlider.value = currentCrayonConfig.red;
    self.greenSlider.value = currentCrayonConfig.green;
    self.blueSlider.value = currentCrayonConfig.blue;
    self.view.backgroundColor = [UIColor colorWithRed:currentCrayonConfig.red green:currentCrayonConfig.green blue:currentCrayonConfig.blue alpha:currentAlpha];
    
    if (currentAlpha <= 0.5 || (currentCrayonConfig.red <= 0.3 && currentCrayonConfig.blue <= 0.3) || (currentCrayonConfig.red <= 0.3 && currentCrayonConfig.green <= 0.3) || (currentCrayonConfig.green <= 0.3 && currentCrayonConfig.blue <= 0.3)) {
        self.redLabel.textColor = UIColor.whiteColor;
        self.blueLable.textColor = UIColor.whiteColor;
        self.greenLabel.textColor = UIColor.whiteColor;
        self.alphaLabel.textColor = UIColor.whiteColor;
        self.crayonTitle.textColor = UIColor.whiteColor;
    } else {
        self.redLabel.textColor = UIColor.blackColor;
        self.blueLable.textColor = UIColor.blackColor;
        self.greenLabel.textColor = UIColor.blackColor;
        self.alphaLabel.textColor = UIColor.blackColor;
        self.crayonTitle.textColor = UIColor.blackColor;
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperChanged:(UIStepper *)sender {
    currentAlpha = sender.value;
    [self setUp];
}
- (IBAction)redSliderChanged:(UISlider *)sender {
    currentCrayonConfig.red = sender.value;
    [self setUp];
}

- (IBAction)greenSliderChanged:(UISlider *)sender {
    currentCrayonConfig.green = sender.value;
    [self setUp];
}
- (IBAction)blueSliderChanged:(UISlider *)sender {
    currentCrayonConfig.blue = sender.value;
    [self setUp];
}

- (IBAction)resetPressed:(UIButton *)sender {
    currentCrayonConfig = [[Crayon alloc] initWithName:_currentCrayon.name red:_currentCrayon.red/255 green:_currentCrayon.green/255 blue:_currentCrayon.blue/255 hex:_currentCrayon.hex];
    currentAlpha = 1.0;
    [self setUp];
}




@end
