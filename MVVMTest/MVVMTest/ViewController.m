//
//  ViewController.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ThirdViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *firstButton;

@property (weak, nonatomic) IBOutlet UIButton *firstButton2;

@property (nonatomic, strong) RACSignal *signal;

@property (nonatomic, strong) RACSubject *subject;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)thirdViewControllerButton:(id)sender {
    ThirdViewController *vc = [[ThirdViewController alloc] initMVVM_ViewController];

    [[[vc.baseVM.requestData execute:nil] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

@end
