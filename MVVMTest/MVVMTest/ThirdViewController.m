//
//  ThirdViewController.m
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self.baseVM;
    
    UINib *cell = [UINib nibWithNibName:@"OrderPayCell" bundle:nil];
    [self.myTableView registerNib:cell forCellReuseIdentifier:@"myccccc"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma - amrk UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"a");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (void)dealloc {
    NSLog(@"ThirdViewController.h    dealloc");
}

@end
