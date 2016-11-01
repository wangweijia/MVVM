//
//  OrderPayCell.h
//  MVVMTest
//
//  Created by apple on 01/11/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrderDetail;

@interface OrderPayCell : UITableViewCell

@property (nonatomic, strong) OrderDetail *orderDetail;

@end
