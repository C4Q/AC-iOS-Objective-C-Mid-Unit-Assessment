//
//  CrayonsViewController.m
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "CrayonsViewController.h"
#import "Crayon.h"
#import "ColorDetailViewController.h"

@interface CrayonsViewController ()

@property (strong,nonatomic) NSArray *crayons;

@end

@implementation CrayonsViewController

 NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Crayons ViewController";
    [self allocInitSubviews];
    [self configureSubviews];
    [self configureTableView];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)allocInitSubviews {
    _crayons = [Crayon allTheCrayons];// [[NSArray alloc] init];

}

-(void)configureSubviews {
    [self configureTableView];
}

-(void)configureTableView {
    _crayonsTableView = [[UITableView alloc] init];
    self.crayonsTableView.dataSource = self;
    self.crayonsTableView.delegate = self;
   
}
#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
       Crayon *selectedCrayon = [self crayons][indexPath.row];
       ColorDetailViewController *colorDetailVC = [[ColorDetailViewController alloc] initWithCrayon:selectedCrayon];
       [self.navigationController pushViewController:colorDetailVC animated:YES];
       

}

#pragma mark - UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    Crayon *selectedCrayon = self.crayons[indexPath.row];
    //cell.backgroundColor = UIColor.blueColor
    cell.textLabel.text = selectedCrayon.name;
    cell.detailTextLabel.text = selectedCrayon.hex;
    UIColor *color = [UIColor colorWithRed:selectedCrayon.red/255 green:selectedCrayon.green/255 blue:selectedCrayon.blue/255 alpha:1];
    cell.backgroundColor = color;
    return cell;
    }



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.crayons.count;
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
