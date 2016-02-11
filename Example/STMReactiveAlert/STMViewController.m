//
//  STMViewController.m
//  STMReactiveAlert
//
//  Created by Stefano Mondino on 12/04/2015.
//  Copyright (c) 2015 Stefano Mondino. All rights reserved.
//

#import "STMViewController.h"
#import <STMReactiveAlert/STMAlertViewModel.h>
#import <STMReactiveAlert/UIViewController+STMReactiveAlertPresenting.h>


@interface STMViewController ()

@end

@implementation STMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self);
    self.btn_open.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self rac_alertSignal];
    }];
}

- (RACSignal*) rac_alertSignal {
    @weakify(self);
    return [RACSignal defer:^RACSignal *{
        
        
        STMAlertViewModel* vm = [STMAlertViewModel new];
        vm.stm_storyboardSceneIdentifier = @"Alert1";
        vm.stm_storyboardName = @"Main";
        return [[[self rac_showAlertWithViewModel:vm] ignore:@0] flattenMap:^RACStream *(id value) {
            @strongify(self);
            return [self rac_alertSignal];
        }];
    }];
}


@end
