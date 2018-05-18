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
@property (strong, nonatomic) UILabel* colorName;
@property (strong, nonatomic) UILabel* redColor;
@property (strong, nonatomic) UISlider* redSlider;
@property (strong, nonatomic) UISlider* greenSlider;
@property (strong, nonatomic) UISlider* blueSlider;
@property (strong, nonatomic) UIStepper* alphaStepper;
@property (strong, nonatomic) UILabel* alphaLabel;
@property (strong, nonatomic) Crayon* crayon;
-(instancetype)initWithCrayon:(Crayon*) crayon;

@end
