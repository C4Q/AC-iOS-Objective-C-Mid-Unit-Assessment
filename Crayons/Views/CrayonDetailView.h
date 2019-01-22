//
//  CrayonDetailView.h
//  Crayons
//
//  Created by Luis Calle on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crayon.h"

@interface CrayonDetailView : UIView

@property (nonatomic) UILabel *crayonNameLabel;
@property (nonatomic) UILabel *redLabel;
@property (nonatomic) UILabel *greenLabel;
@property (nonatomic) UILabel *blueLabel;
@property (nonatomic) UILabel *alphaLabel;

@property (nonatomic) UISlider *redSlider;
@property (nonatomic) UISlider *greenSlider;
@property (nonatomic) UISlider *blueSlider;

@property (nonatomic) UIStepper *alphaStepper;

@property (nonatomic) UIButton *resetButton;

- (void)configureCrayonView: (Crayon*)crayon;

@end
