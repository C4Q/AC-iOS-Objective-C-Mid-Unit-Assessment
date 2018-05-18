//
//  CrayonDetailViewController.h
//  Crayons
//
//  Created by Luis Calle on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Crayon.h"

@interface CrayonDetailViewController : UIViewController

@property (strong, nonatomic) Crayon* crayon;

-(instancetype)initWithCrayon:(Crayon *)crayon;

@end
