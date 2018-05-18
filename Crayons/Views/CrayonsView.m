//
//  CrayonsView.m
//  Crayons
//
//  Created by Luis Calle on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonsView.h"

@implementation CrayonsView

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self setupCrayonsTableView];
}

- (void)setupCrayonsTableView {
    if (!_crayonsTableView) {
        _crayonsTableView = [[UITableView alloc] initWithFrame:CGRectZero];
        [self addSubview:_crayonsTableView];
        [_crayonsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"crayon cell"];
    }
    _crayonsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [_crayonsTableView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor],
                                              [_crayonsTableView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor],
                                              [_crayonsTableView.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor],
                                              [_crayonsTableView.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor]
                                              ]];
    
}

@end
