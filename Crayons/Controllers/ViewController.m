//
//  ViewController.m
//  Crayons
//
//  Created by Alex Paul on 5/17/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "ViewController.h"
#import "Crayon.h"
#import "detailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSArray *crayonArr;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.crayonTableView.delegate = self;
    self.crayonTableView.dataSource = self;
    crayonArr = [Crayon allTheCrayons];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellName = @"crayonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    Crayon *crayonToSet = [crayonArr objectAtIndex:indexPath.row];
    cell.textLabel.text = [crayonToSet name];
    cell.detailTextLabel.text = [crayonToSet hex];
    UIColor *bgColor = [UIColor colorWithRed:[crayonToSet red]/255 green:[crayonToSet green]/255 blue:[crayonToSet blue]/255 alpha:1];
    cell.backgroundColor = bgColor;
    if ([cell.textLabel.text isEqualToString:@"Black"]) {
        cell.textLabel.textColor = UIColor.whiteColor;
        cell.detailTextLabel.textColor = UIColor.whiteColor;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return crayonArr.count;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    detailViewController *vc = segue.destinationViewController;
    NSInteger *crayonIndex = [self.crayonTableView indexPathForSelectedRow].row;
    vc.currentCrayon = [crayonArr objectAtIndex:crayonIndex];
}
@end
