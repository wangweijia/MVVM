//
//  OrderDetail.h
//  MVVMTest
//
//  Created by apple on 01/11/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OrderDetail : NSObject

@property (nonatomic, assign) CGFloat actualAmount;

@property (nonatomic, assign) NSInteger businessId;

@property (nonatomic, assign) NSInteger businessType;

@property (nonatomic, copy) NSString *orderDetail;

@property (nonatomic, copy) NSString *tradeWayName;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
