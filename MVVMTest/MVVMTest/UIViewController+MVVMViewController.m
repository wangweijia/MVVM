//
//  UIViewController+MVVMViewController.m
//  MVVMTest
//
//  Created by apple on 31/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "UIViewController+MVVMViewController.h"
#import "NSObject+MVVMViewModel.h"
#import <objc/runtime.h>

static NSString *MVVM_baseVM = @"_MVVM_baseVM";

@implementation UIViewController (MVVMViewController)

- (instancetype)initMVVM_ViewController {
    self = [self init];
    if (self) {
        if (!self.baseVM) {
            NSString *className = NSStringFromClass(self.class);
            NSString *vmName = [NSString stringWithFormat:@"%@%@",className,@"VM"];
            Class vmClass = NSClassFromString(vmName);
            if (vmClass) {
                self.baseVM = [[vmClass alloc] initMVVM_viewModelWithViewController:self];
            }
        }
    }
    return self;
}

- (void)setBaseVM:(id)baseVM {
    objc_setAssociatedObject(self, &MVVM_baseVM, baseVM, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self baseVM];
}

- (id)baseVM {
    return objc_getAssociatedObject(self, &MVVM_baseVM);
}

@end
