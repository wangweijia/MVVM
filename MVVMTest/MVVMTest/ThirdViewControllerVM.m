//
//  ThirdViewControllerVM.m
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ThirdViewControllerVM.h"
#import "OrderPayCell.h"
#import "OrderDetail.h"

@interface ThirdViewControllerVM()

@end

@implementation ThirdViewControllerVM

- (void)initialBind {    
    [self bindRequest];
}

/**
 *  绑定 网络请求
 */
- (void)bindRequest {
    _requestData = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSString *urlStr = @"http://www.921cha.com/apps-server/account_rmb/get_user_rmb_balance.json?k=1AHMWBThBMXq7J&pageNo=0&t=1&_c=1&_sdk=10.100000&v=41703&_n=2&udid=299e753c4bfaa77fb3b2188183d835b8a2c68820&_ct=1477970517207";
            NSURL *url = [NSURL URLWithString:urlStr];
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *dataTake = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSArray *result = dic[@"page"][@"result"];
                self.dataSource = [NSMutableArray array];
                
                for (NSDictionary *dic in result) {
                    @autoreleasepool {
                        OrderDetail *orderDetail = [[OrderDetail alloc] initWithDictionary:dic];
                        [self.dataSource addObject:orderDetail];
                    }
                }
                
                [subscriber sendNext:@"医生信息请求完成"];
                [subscriber sendCompleted];
            }];
            [dataTake resume];
            
            return nil;
        }];
    }];
}

#pragma - mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderPayCell *cell = (OrderPayCell *)[tableView dequeueReusableCellWithIdentifier:@"myccccc" forIndexPath:indexPath];
    
    OrderDetail *orderDetail = self.dataSource[indexPath.row];
    cell.orderDetail = orderDetail;
    return cell;
}

@end
