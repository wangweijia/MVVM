//
//  ThirdViewControllerVM.m
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ThirdViewControllerVM.h"
#import "OrderDetail.h"

@interface ThirdViewControllerVM() <UITableViewDataSource>

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
            NSURLRequest *requst = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
            [NSURLConnection sendAsynchronousRequest:requst queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
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
            
            return nil;
        }];
    }];
}

#pragma - mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
