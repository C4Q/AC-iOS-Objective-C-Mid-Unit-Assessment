//
//  ColorDetailViewController.h
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crayon.h"

@interface ColorDetailViewController : UIViewController

@property (strong, nonatomic) Crayon* color;
@property (strong, nonatomic) UILabel *colorName;
@property (strong, nonatomic) UISlider *redSlider;
@property (strong, nonatomic) UILabel *redLabel;
@property (strong, nonatomic) UISlider *greenSlider;
@property (strong, nonatomic) UILabel *greenLabel;
@property (strong, nonatomic) UISlider *blueSlider;
@property (strong, nonatomic) UILabel *blueLabel;
@property (strong, nonatomic) UIStepper *alphaStepper;
@property (strong, nonatomic) UILabel *alphaLabel;
@property (strong, nonatomic) UIButton *resetButton;
@property double currentRed;
@property double currentGreen;
@property double currentBlue;
@property double currentAlpha;

-(instancetype)initWithColor: (Crayon*) color;
-(void)changeRed:(id)sender;
-(void)changeGreen:(id)sender;
-(void)changeBlue:(id)sender;
-(void)changeAlpha:(id)sender;
-(void)resetColor:(id)sender;
@end
