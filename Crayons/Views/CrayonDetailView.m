//
//  CrayonDetailView.m
//  Crayons
//
//  Created by Luis Calle on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonDetailView.h"

@implementation CrayonDetailView

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self allocInitSubviews];
        [self setupSubviews];
    }
    return self;
}

- (void)allocInitSubviews {
    _crayonNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _redLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_redLabel setText:@"Red: 0.0"];
    _greenLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_greenLabel setText:@"Green: 0.0"];
    _blueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_blueLabel setText:@"Blue: 0.0"];
    _alphaLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_alphaLabel setText:@"Alpha: 1.0"];
    
    _redSlider = [[UISlider alloc] initWithFrame:CGRectZero];
    [_redSlider setMinimumValue:0];
    [_redSlider setMaximumValue:1];
    _greenSlider = [[UISlider alloc] initWithFrame:CGRectZero];
    [_greenSlider setMinimumValue:0];
    [_greenSlider setMaximumValue:1];
    _blueSlider = [[UISlider alloc] initWithFrame:CGRectZero];
    [_greenSlider setMinimumValue:0];
    [_greenSlider setMaximumValue:1];
    
    _alphaStepper = [[UIStepper alloc] initWithFrame:CGRectZero];
    [_alphaStepper setMaximumValue:1.0];
    [_alphaStepper setMinimumValue:0];
    [_alphaStepper setStepValue: 0.1];
    [_alphaStepper setValue:1.0];
    
    _resetButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [_resetButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
}

- (void)setupSubviews {
    [self setupCrayonNameLabel];
    [self setupRedSlider];
    [self setupRedLabel];
    [self setupGreenSlider];
    [self setupGreenLabel];
    [self setupBlueSlider];
    [self setupBlueLabel];
    [self setupAlphaStepper];
    [self setupAlphaLabel];
    [self setupResetButton];
}

- (void)setupCrayonNameLabel {
    [self addSubview:_crayonNameLabel];
    [_crayonNameLabel setTextAlignment: NSTextAlignmentCenter];
    _crayonNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                          [_crayonNameLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor],
                                          [_crayonNameLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor],
                                          [_crayonNameLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor],
                                          [_crayonNameLabel.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                          ]];
}

- (void)setupRedSlider {
    [self addSubview:_redSlider];
    _redSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_redSlider.topAnchor constraintEqualToAnchor:_crayonNameLabel.bottomAnchor],
                                              [_redSlider.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant: 32],
                                              [_redSlider.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant: -32],
                                              [_redSlider.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}
- (void)setupRedLabel {
    [self addSubview:_redLabel];
    [_redLabel setTextAlignment: NSTextAlignmentCenter];
    _redLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_redLabel.topAnchor constraintEqualToAnchor:_redSlider.bottomAnchor],
                                              [_redLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor],
                                              [_redLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor],
                                              [_redLabel.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}



- (void)setupGreenSlider {
    [self addSubview:_greenSlider];
    _greenSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_greenSlider.topAnchor constraintEqualToAnchor:_redLabel.bottomAnchor],
                                              [_greenSlider.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant: 32],
                                              [_greenSlider.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant: -32],
                                              [_greenSlider.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}
- (void)setupGreenLabel {
    [self addSubview:_greenLabel];
    [_greenLabel setTextAlignment: NSTextAlignmentCenter];
    _greenLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_greenLabel.topAnchor constraintEqualToAnchor:_greenSlider.bottomAnchor],
                                              [_greenLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor],
                                              [_greenLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor],
                                              [_greenLabel.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}



- (void)setupBlueSlider {
    [self addSubview:_blueSlider];
    _blueSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_blueSlider.topAnchor constraintEqualToAnchor:_greenLabel.bottomAnchor],
                                              [_blueSlider.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant: 32],
                                              [_blueSlider.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant: -32],
                                              [_blueSlider.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}
- (void)setupBlueLabel {
    [self addSubview:_blueLabel];
    [_blueLabel setTextAlignment: NSTextAlignmentCenter];
    _blueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_blueLabel.topAnchor constraintEqualToAnchor:_blueSlider.bottomAnchor],
                                              [_blueLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor],
                                              [_blueLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor],
                                              [_blueLabel.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}


// HERE
- (void)setupAlphaStepper {
    [self addSubview:_alphaStepper];
    _alphaStepper.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_alphaStepper.topAnchor constraintEqualToAnchor:_blueLabel.bottomAnchor],
                                              [_alphaStepper.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                              [_alphaStepper.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}
- (void)setupAlphaLabel {
    [self addSubview:_alphaLabel];
    [_alphaLabel setTextAlignment: NSTextAlignmentCenter];
    _alphaLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_alphaLabel.topAnchor constraintEqualToAnchor:_alphaStepper.bottomAnchor],
                                              [_alphaLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor],
                                              [_alphaLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor],
                                              [_blueLabel.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}



- (void)setupResetButton {
    [self addSubview:_resetButton];
    _resetButton.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_resetButton.topAnchor constraintEqualToAnchor:_alphaLabel.bottomAnchor],
                                              [_resetButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                              [_resetButton.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor],
                                              [_resetButton.heightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.heightAnchor multiplier:0.1]
                                              ]];
}

- (void) configureCrayonView:(Crayon *)crayon {
    [_crayonNameLabel setText: [crayon name]];
    [_crayonNameLabel setFont:[UIFont systemFontOfSize:30]];
    [_redSlider setValue:[crayon red]/255];
    [_greenSlider setValue:[crayon green]/255];
    [_blueSlider setValue:[crayon blue]/255];
    
    NSMutableString* redValue = [NSMutableString stringWithFormat:@"Red: %f", [crayon red]/255];
    NSMutableString* greenValue = [NSMutableString stringWithFormat:@"Green:  %f", [crayon green]/255];
    NSMutableString* blueValue = [NSMutableString stringWithFormat:@"Blue: %f", [crayon blue]/255];
    
    [_redLabel setText:redValue];
    [_greenLabel setText:greenValue];
    [_blueLabel setText:blueValue];
}


@end
