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

/**
 为了方便转换成（ThirdViewControllerVM *）重写声明

 @return ThirdViewControllerVM 类型的 baseVM
 */
- (ThirdViewControllerVM *)baseVM;

@end
