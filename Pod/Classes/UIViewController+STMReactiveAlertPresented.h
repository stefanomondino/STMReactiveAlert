//
//  UIViewController+STMReactiveAlertPresented.h
//  Pods
//
//  Created by Stefano Mondino on 12/01/16.
//
//

#import <UIKit/UIKit.h>
#import "STMAlertViewModel.h"
#import "UIViewController+STMReactiveAlertPresented.h"
@protocol STMAlertViewControllerProtocol <NSObject>

@required
@property (strong, nonatomic) id<STMAlertViewModelProtocol> stm_alertViewModel;

@optional
@property (weak, nonatomic) IBOutlet UIButton *btn_cancel;
@property (weak, nonatomic) IBOutlet UIButton *btn_confirm;
@end


@interface UIViewController(STMAlertViewControllerPresented) <STMAlertViewControllerProtocol>
- (void)stm_alert_viewDidLoad ;
@end

