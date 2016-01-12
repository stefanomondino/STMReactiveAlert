//
//  UIViewController+STMReactiveAlertPresented.m
//  Pods
//
//  Created by Stefano Mondino on 12/01/16.
//
//

#import "UIViewController+STMReactiveAlertPresented.h"

@implementation UIViewController (STMReactiveAlertPresented)

//@dynamic btn_cancel,btn_confirm,stm_alertViewModel;


- (void)stm_alert_viewDidLoad {
    self.btn_cancel.tag = 0;
    self.btn_confirm.tag = 1;
    @weakify(self);
    RAC(self,btn_cancel.rac_command) = RACObserve(self, stm_alertViewModel.stm_rac_selectionCommand);
    RAC(self,btn_confirm.rac_command) = RACObserve(self, stm_alertViewModel.stm_rac_selectionCommand);
    
    [RACObserve(self, stm_alertViewModel.stm_rac_selectionCommand.executionSignals).switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }];
}
@end
