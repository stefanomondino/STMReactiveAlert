//
//  UIViewController+STMReactiveAlert.m
//  Pods
//
//  Created by Stefano Mondino on 04/12/15.
//
//

#import "UIViewController+STMReactiveAlertPresenting.h"
@import UIKit;

@implementation UIViewController(STMReactiveAlertPresenting)

- (RACSignal*) rac_showAlertWithViewModel:(id<STMAlertViewModelProtocol>) viewModel{
    @weakify(self);
    return [RACSignal defer:^RACSignal *{
        @strongify(self);
        [self showAlertWithViewModel:viewModel];
        return [viewModel.stm_rac_selectionCommand.executionSignals.flatten take:1];
    }];
}

- (void) showAlertWithViewModel:(id<STMAlertViewModelProtocol>) viewModel {
    @weakify(self);
    if ([self.presentedViewController isKindOfClass:[MZFormSheetPresentationViewController class]]) {
        MZFormSheetPresentationViewController* sheet = (MZFormSheetPresentationViewController*)self.presentedViewController;
        RACSignal* dismissSignal = [[sheet rac_signalForSelector:@selector(viewDidDisappear:)] take:1];
        [dismissSignal subscribeNext:^(id x) {
            @strongify(self);
            [self showAlertWithViewModel:viewModel];
        }];
        if (sheet.isBeingDismissed == NO) {
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }
        return;
    };
    
    UIViewController * viewController = [self alertWithViewModel:viewModel];
    
    MZFormSheetPresentationViewController *formSheet = [[MZFormSheetPresentationViewController alloc] initWithContentViewController:viewController];
    
    [self setupPresentationController:formSheet];
    
    [self presentViewController:formSheet animated:YES completion:^{
        
    }];
    
}
- (void) setupPresentationController:(id) controller {
    ;
}
- (UIViewController<STMAlertViewControllerProtocol>*) alertWithViewModel:(id<STMAlertViewModelProtocol>) viewModel {
    UIViewController<STMAlertViewControllerProtocol>* vc = [[UIStoryboard storyboardWithName:viewModel.stm_storyboardName bundle:nil] instantiateViewControllerWithIdentifier:viewModel.stm_storyboardSceneIdentifier];
    vc.stm_alertViewModel = viewModel;
    return vc;
}

@end
