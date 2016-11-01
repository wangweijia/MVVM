//
//  OrderPayCell.m
//  MVVMTest
//
//  Created by apple on 01/11/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "OrderPayCell.h"
#import "OrderDetail.h"

@interface OrderPayCell ()

@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UILabel *label4;

@property (weak, nonatomic) IBOutlet UILabel *label5;

@end

@implementation OrderPayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setOrderDetail:(OrderDetail *)orderDetail {
    _orderDetail = orderDetail;
    
    self.label1.text = [NSString stringWithFormat:@"%@",@(orderDetail.actualAmount)];
    self.label2.text = [NSString stringWithFormat:@"%@",@(orderDetail.businessId)];
    self.label3.text = [NSString stringWithFormat:@"%@",@(orderDetail.businessType)];
    self.label4.text = orderDetail.orderDetail;
    self.label5.text = orderDetail.tradeWayName;
}

@end
