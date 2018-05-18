//
//  ColorsViewController.h
//  Crayons
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crayon.h"

@interface ColorsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *colorsTableView;
@property (strong, nonatomic) NSArray *colors;

@end
