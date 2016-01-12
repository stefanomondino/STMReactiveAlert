//
//  UIViewController+STMReactiveAlert.h
//  Pods
//
//  Created by Stefano Mondino on 04/12/15.
//
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "NSObject+STMAlertViewModelPresented.h"
#import "MZFormSheetPresentationViewController.h"
#import "UIViewController+STMReactiveAlertPresented.h"

@interface UIViewController (STMReactiveAlertPresenting)
- (void) showAlertWithViewModel:(id<STMAlertViewModelProtocol>) viewModel;
- (RACSignal*) rac_showAlertWithViewModel:(id<STMAlertViewModelProtocol>) viewModel;
@end
