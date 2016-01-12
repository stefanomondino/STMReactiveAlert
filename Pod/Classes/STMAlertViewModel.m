//
//  STMAlertViewModel.m
//  Pods
//
//  Created by Stefano Mondino on 04/12/15.
//
//

#import "STMAlertViewModel.h"






@implementation STMAlertViewModel
@synthesize stm_storyboardName,stm_rac_selectionCommand,stm_storyboardSceneIdentifier;

- (instancetype)init {
    self = [super init];
    [self stm_alertViewModel_init];
    return self;
}

- (RACSignal*) stm_rac_selectionSignalWithInput:(id) input {
    NSInteger tag = 0;
    if ([input isKindOfClass:[UIButton class]]) {
        tag = [(UIButton*)input tag];
    }
    if ([input isKindOfClass:[NSIndexPath class]]) {
        tag = [(NSIndexPath*)input item];
    }
    return [RACSignal return:@(tag)];
    
}
@end