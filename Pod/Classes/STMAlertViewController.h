//
//  STMAlertViewController.h
//  Pods
//
//  Created by Stefano Mondino on 04/12/15.
//
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "STMAlertViewModel.h"
@protocol STMAlertViewControllerProtocol <NSObject>

@required
@property (strong, nonatomic) id<STMAlertViewModelProtocol> stm_alertViewModel;

@optional
@property (weak, nonatomic) IBOutlet UIButton *btn_cancel;
@property (weak, nonatomic) IBOutlet UIButton *btn_confirm;
@end


@interface UIViewController(STMAlertViewController) <STMAlertViewControllerProtocol>
@end
