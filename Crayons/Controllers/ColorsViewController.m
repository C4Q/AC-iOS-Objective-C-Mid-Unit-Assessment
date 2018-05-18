//
//  ColorsViewController.m
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "ColorsViewController.h"
#import "Crayon.h"
#import "ColorDetailViewController.h"

#define CELLID "Color Cell"

@interface ColorsViewController ()

@end

@implementation ColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackgroundColor];
    [self allocInitSubviews];
    [self configureSubviews];
    [self addSubviews];
    [self configureConstraints];
    [self loadColors];
}

- (void)setBackgroundColor {
    [self.view setBackgroundColor:UIColor.yellowColor];
}

-(void)allocInitSubviews {
    _colorsTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    _colors = [[NSArray alloc] init];
}

-(void)configureSubviews {
    [self configureTableView];
}

-(void)configureTableView {
    self.colorsTableView.delegate = self;
    self.colorsTableView.dataSource = self;
    [self.colorsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@CELLID];
}

-(void)addSubviews {
    [self.view addSubview:self.colorsTableView];
}

-(void)configureConstraints {
    self.colorsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.colorsTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                                              [self.colorsTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                                              [self.colorsTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                              [self.colorsTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
                                              ]
     ];
}

#pragma mark Load/Filter Data

-(void)loadColors {
    self.colors = [Crayon allTheCrayons];
    [self.colorsTableView reloadData];
}

#pragma mark TableView Data Source Methods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@CELLID forIndexPath:indexPath];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@CELLID];
    if (cell) {
        Crayon* color = [self colors][indexPath.row];
        cell.textLabel.text = color.name;
        cell.detailTextLabel.text = color.hex;
        cell.textLabel.textColor = UIColor.whiteColor;
        cell.detailTextLabel.textColor = UIColor.whiteColor;
        cell.backgroundColor = [UIColor colorWithRed:color.red/255 green:color.green/255 blue:color.blue/255 alpha:1.0];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self colors].count;
}

#pragma mark TableView Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Crayon* selectedColor = [self colors][indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ColorDetailViewController *colorDetailVC = (ColorDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ColorDetailViewController"];
        colorDetailVC.color = selectedColor;
    
    [self.navigationController pushViewController:colorDetailVC animated:true];
}

@end
