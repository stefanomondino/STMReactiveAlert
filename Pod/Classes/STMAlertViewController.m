//
//  STMAlertViewController.m
//  Pods
//
//  Created by Stefano Mondino on 04/12/15.
//
//

#import "STMAlertViewController.h"



@implementation STMAlertViewController
@synthesize stm_alertViewModel,btn_cancel,btn_confirm;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self stm_alert_viewDidLoad];
}
@end