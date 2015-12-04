//
//  UIViewController+STMReactiveAlert.h
//  Pods
//
//  Created by Stefano Mondino on 04/12/15.
//
//

#import <UIKit/UIKit.h>
#import "STMAlertViewModel.h"
#import "STMAlertViewController.h"
#import <MZFormSheetPresentationViewController.h>
@interface UIViewController (STMReactiveAlert)
- (void) showAlertWithViewModel:(id<STMAlertViewModelProtocol>) viewModel;
- (RACSignal*) rac_showAlertWithViewModel:(id<STMAlertViewModelProtocol>) viewModel;
@end
