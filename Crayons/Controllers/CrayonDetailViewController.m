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
    self.title = [_crayon name];
}

@end
