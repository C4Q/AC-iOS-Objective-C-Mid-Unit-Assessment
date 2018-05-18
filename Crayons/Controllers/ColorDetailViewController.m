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
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBackgroundColor];
    [self allocInitSubviews];
    [self configureSubviews];
    [self addSubviews];
    [self configureConstraints];
}

-(void)setUpBackgroundColor {
    UIColor *color = [UIColor colorWithRed:_crayon.red/255 green:_crayon.green/255 blue:_crayon.blue/255 alpha:1];
    self.view.backgroundColor = color;
}

-(void)allocInitSubviews {
    _colorName = [[UILabel alloc] initWithFrame:CGRectZero];
    _redColor = [[UILabel alloc] initWithFrame:CGRectZero];
}

-(void)configureSubviews {

    self.colorName.text = _crayon.name;
    
}

-(void)addSubviews {
    [self.view addSubview:self.colorName];
}

-(void)configureConstraints {
  self.colorName.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                                [self.colorName.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant: 40],
                                                //[self.colorName.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
                                                [self.colorName.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 150],
                                                [self.colorName.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor ]
                                                 ]
     ];
}


@end
