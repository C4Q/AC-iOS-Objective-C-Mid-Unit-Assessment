//
//  CrayonsViewController.m
//  Crayons
//
//  Created by Luis Calle on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonsViewController.h"
#import "CrayonDetailViewController.h"
#import "CrayonsView.h"
#import "Crayon.h"

#define CELLID "crayon cell"

@interface CrayonsViewController ()

@property (nonatomic) CrayonsView *crayonsView;

@end

@implementation CrayonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if(!_crayonsView) {
        _crayonsView = [[CrayonsView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _crayonsView.crayonsTableView.delegate = self;
        _crayonsView.crayonsTableView.dataSource = self;
    }
    [self.view addSubview: _crayonsView];
    self.title = @"Crayons";
}


#pragma mark - UITableView Data Source Methods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *crayonCell = [tableView dequeueReusableCellWithIdentifier:@CELLID forIndexPath:indexPath];
    
    if (crayonCell) {
        crayonCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@CELLID];
        Crayon *crayon = [Crayon allTheCrayons][indexPath.row];
        UIColor *bgColor = [UIColor colorWithRed:[crayon red]/255 green:[crayon green]/255 blue:[crayon blue]/255 alpha:1.0];
        crayonCell.backgroundColor = bgColor;
        [crayonCell.textLabel setText:[crayon name]];
        [crayonCell.detailTextLabel setText:[crayon hex]];
    }
    return crayonCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Crayon allTheCrayons].count;
}

#pragma mark - UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CrayonDetailViewController *crayonDetailVC = [[CrayonDetailViewController alloc] initWithCrayon:[Crayon allTheCrayons][indexPath.row]];
    [self.navigationController pushViewController:crayonDetailVC animated:YES];
}

@end
