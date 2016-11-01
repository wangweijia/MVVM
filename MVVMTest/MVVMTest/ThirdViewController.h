//
//  ThirdViewController.h
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MVVMViewController.h"
#import "ThirdViewControllerVM.h"

@interface ThirdViewController : UIViewController

- (ThirdViewControllerVM *)baseVM;

@end
