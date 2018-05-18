//
//  ViewController.m
//  Crayons
//
//  Created by Alex Paul on 5/17/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "ViewController.h"
#import "Crayon.h"
#import "DetailViewController.h"
#define CELLID "CrayonCell"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _crayons = Crayon.allTheCrayons;
}


//TableView DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _crayons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrayonCell" forIndexPath:indexPath];
    if (cell) {
        Crayon *crayon;
        crayon = [self crayons][indexPath.row];
        cell.textLabel.text = crayon.name;
        cell.detailTextLabel.text = crayon.hex;
        cell.backgroundColor = [UIColor colorWithRed:crayon.redFloat green:crayon.greenFloat blue:crayon.blueFLoat alpha:1];
        
    }
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    Crayon *selectedCrayon = [self crayons][_tableView.indexPathForSelectedRow.row];
    if ([segue.identifier  isEqual: @"cellSegue"]) {
        DetailViewController *detalVC = (DetailViewController *)segue.destinationViewController;
        detalVC.crayon = selectedCrayon;
    }


   
}





@end
