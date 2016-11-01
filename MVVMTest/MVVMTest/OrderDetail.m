//
//  OrderDetail.m
//  MVVMTest
//
//  Created by apple on 01/11/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "OrderDetail.h"

@implementation OrderDetail

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        self.actualAmount = [dic[@"actualAmount"] floatValue];
        self.businessId = [dic[@"businessId"] integerValue];
        self.businessType = [dic[@"businessType"] integerValue];
        self.orderDetail = dic[@"orderDetail"];
        self.tradeWayName = dic[@"tradeWayName"];
    }
    return self;
}

@end
