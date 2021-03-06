//
//  ThirdViewControllerVM.h
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+MVVMViewModel.h"
@class ThirdViewController;

@interface ThirdViewControllerVM : NSObject <UITableViewDataSource>

#pragma - mark 与 vc 通信的功能
/**
 *  请求医生
 */
@property (nonatomic, strong, readonly) RACCommand *requestData;

/**
 保存 TableView 数据源
 */
@property (nonatomic, strong) NSMutableArray *dataSource;

/**
 为了方便转换成（ThirdViewController *）重写声明

 @return ThirdViewController 类型
 */
- (ThirdViewController *)targetVC;

@end
