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

-(instancetype)initWithCrayon:(Crayon *)crayon {
    self = [super init];
    if (self) {
        _crayon = crayon;
    }
    return self;
}

//double redColor, greenColor, blueColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBackgroundColor];
    [self allocInitSubviews];
    [self configureSubviews];
    [self addSubviews];
    [self configureConstraints];
    _redColor.text = [NSString stringWithFormat:@"%g", _crayon.red/255];
    _blueColor.text = [NSString stringWithFormat:@"%g", _crayon.blue/255];
    _greenColor.text = [NSString stringWithFormat:@"%g", _crayon.green/255];
    
}

-(void)setUpBackgroundColor {
    UIColor *color = [UIColor colorWithRed:_crayon.red/255 green:_crayon.green/255 blue:_crayon.blue/255 alpha:1];
    self.view.backgroundColor = color;
}

-(void)allocInitSubviews {
    _colorName = [[UILabel alloc] initWithFrame:CGRectZero];
    _redColor = [[UILabel alloc] initWithFrame:CGRectZero];
    _blueColor = [[UILabel alloc] initWithFrame:CGRectZero];
    _greenColor = [[UILabel alloc] initWithFrame:CGRectZero];
}

-(void)configureSubviews {

    self.colorName.text = _crayon.name;
    
    
}

-(void)addSubviews {
    [self.view addSubview:self.colorName];
    [self.view addSubview:self.redColor];
    [self.view addSubview:self.blueColor];
    [self.view addSubview:self.greenColor];
}

-(void)configureConstraints {
  self.colorName.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                                [self.colorName.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant: 40],
                                                [self.colorName.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 150],
                                                [self.colorName.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor ]
                                                 ]
     ];
     self.redColor.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.redColor.topAnchor constraintEqualToAnchor:self.colorName.bottomAnchor constant: 40],
                                              //[self.colorName.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
                                              [self.redColor.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 180],
                                              [self.redColor.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor ]
                                              ]
     ];
    
    self.blueColor.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.blueColor.topAnchor constraintEqualToAnchor:self.redColor.bottomAnchor constant: 40],
                                              //[self.colorName.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
                                              [self.blueColor.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 180],
                                              [self.blueColor.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor ]
                                              ]
     ];
    
    self.greenColor.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.greenColor.topAnchor constraintEqualToAnchor:self.blueColor.bottomAnchor constant: 40],
                                              //[self.colorName.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
                                              [self.greenColor.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 180],
                                              [self.greenColor.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor ]
                                              ]
     ];
}


@end
