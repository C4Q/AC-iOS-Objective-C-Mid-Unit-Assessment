//
//  CrayonDetailViewController.m
//  Crayons
//
//  Created by Luis Calle on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonDetailViewController.h"
#import "CrayonDetailView.h"

@interface CrayonDetailViewController ()

@property (nonatomic) CrayonDetailView *crayonDetailView;

@end

@implementation CrayonDetailViewController

-(instancetype)initWithCrayon:(Crayon *)crayon {
    self = [super init];
    if (self) {
        _crayon = crayon;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(!_crayonDetailView) {
        _crayonDetailView = [[CrayonDetailView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    }
    [self.view addSubview: _crayonDetailView];
    self.view.backgroundColor = [UIColor colorWithRed:[_crayon red]/255 green:[_crayon green]/255 blue:[_crayon blue]/255 alpha:1.0];
    [_crayonDetailView configureCrayonView: _crayon];
    
    [self setSlidersChanged];
    [self setSteppedChanged];
    
    [_crayonDetailView.resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) reset {
    UIColor *original = [UIColor colorWithRed:[_crayon red]/255 green:[_crayon green]/255 blue:[_crayon blue]/255 alpha:1.0];
    [self.view setBackgroundColor: original];
    
    NSMutableString* redValue = [NSMutableString stringWithFormat:@"Red: %f", [_crayon red]/255];
    NSMutableString* greenValue = [NSMutableString stringWithFormat:@"Green:  %f", [_crayon green]/255];
    NSMutableString* blueValue = [NSMutableString stringWithFormat:@"Blue: %f", [_crayon blue]/255];
    
    [_crayonDetailView.redLabel setText:redValue];
    [_crayonDetailView.greenLabel setText:greenValue];
    [_crayonDetailView.blueLabel setText:blueValue];
    
    [_crayonDetailView.redSlider setValue:[_crayon red]/255];
    [_crayonDetailView.greenSlider setValue:[_crayon green]/255];
    [_crayonDetailView.blueSlider setValue:[_crayon blue]/255];
    
    [_crayonDetailView.alphaStepper setValue:1.0];
    [_crayonDetailView.alphaLabel setText:@"Alpha: 1.0"];
    
    
}

- (void) setSteppedChanged {
    [_crayonDetailView.alphaStepper addTarget:self action:@selector(alphaStepperChanged) forControlEvents:UIControlEventValueChanged];
}

- (void) alphaStepperChanged {
    NSMutableString* alphaValue = [NSMutableString stringWithFormat:@"Alpha: %f", [_crayonDetailView.alphaStepper value]];
    [_crayonDetailView.alphaLabel setText:alphaValue];
    UIColor *col = [UIColor colorWithRed:[_crayonDetailView.redSlider value] green:[_crayonDetailView.greenSlider value] blue:[_crayonDetailView.blueSlider value] alpha:[_crayonDetailView.alphaStepper value]];
    
    
    if ([_crayonDetailView.alphaStepper value] <= 0.5) {
        [self makeLabelsWhite];
    } else if ([_crayonDetailView.alphaStepper value] > 0.5) {
        [self makeLabelsBlack];
    }
    
    [self.view setBackgroundColor:col];
}

- (void) setSlidersChanged {
    [_crayonDetailView.redSlider addTarget:self action:@selector(redSliderChanged) forControlEvents:UIControlEventValueChanged];
    [_crayonDetailView.greenSlider addTarget:self action:@selector(greenSliderChanged) forControlEvents:UIControlEventValueChanged];
    [_crayonDetailView.blueSlider addTarget:self action:@selector(blueSliderChanged) forControlEvents:UIControlEventValueChanged];
}

- (void) redSliderChanged {
    NSMutableString* redValue = [NSMutableString stringWithFormat:@"Red: %f", [_crayonDetailView.redSlider value]];
    [_crayonDetailView.redLabel setText:redValue];
    UIColor *col = [UIColor colorWithRed:[_crayonDetailView.redSlider value] green:[_crayonDetailView.greenSlider value] blue:[_crayonDetailView.blueSlider value] alpha:[_crayonDetailView.alphaStepper value]];
    [self.view setBackgroundColor:col];
}

- (void) greenSliderChanged {
    NSMutableString* greenValue = [NSMutableString stringWithFormat:@"Green: %f", [_crayonDetailView.greenSlider value]];
    [_crayonDetailView.greenLabel setText:greenValue];
    UIColor *col = [UIColor colorWithRed:[_crayonDetailView.redSlider value] green:[_crayonDetailView.greenSlider value] blue:[_crayonDetailView.blueSlider value] alpha:[_crayonDetailView.alphaStepper value]];
    [self.view setBackgroundColor:col];
}

- (void) blueSliderChanged {
    NSMutableString* blueValue = [NSMutableString stringWithFormat:@"Blue: %f", [_crayonDetailView.blueSlider value]];
    [_crayonDetailView.blueLabel setText:blueValue];
    UIColor *col = [UIColor colorWithRed:[_crayonDetailView.redSlider value] green:[_crayonDetailView.greenSlider value] blue:[_crayonDetailView.blueSlider value] alpha:[_crayonDetailView.alphaStepper value]];
    [self.view setBackgroundColor:col];
}

- (void)makeLabelsWhite {
    [_crayonDetailView.crayonNameLabel setTextColor:[UIColor whiteColor]];
    [_crayonDetailView.redLabel setTextColor:[UIColor whiteColor]];
    [_crayonDetailView.greenLabel setTextColor:[UIColor whiteColor]];
    [_crayonDetailView.blueLabel setTextColor:[UIColor whiteColor]];
    [_crayonDetailView.alphaLabel setTextColor:[UIColor whiteColor]];
}

- (void)makeLabelsBlack {
    [_crayonDetailView.crayonNameLabel setTextColor:[UIColor blackColor]];
    [_crayonDetailView.redLabel setTextColor:[UIColor blackColor]];
    [_crayonDetailView.greenLabel setTextColor:[UIColor blackColor]];
    [_crayonDetailView.blueLabel setTextColor:[UIColor blackColor]];
    [_crayonDetailView.alphaLabel setTextColor:[UIColor blackColor]];
}

@end
