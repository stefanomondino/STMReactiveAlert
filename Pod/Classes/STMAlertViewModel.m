//
//  STMAlertViewModel.m
//  Pods
//
//  Created by Stefano Mondino on 04/12/15.
//
//

#import "STMAlertViewModel.h"


@implementation NSObject(STMAlertViewModel)
@dynamic stm_storyboardName,stm_rac_selectionCommand,stm_storyboardSceneIdentifier;

- (instancetype)stm_alertViewModel_init {

    self.stm_rac_selectionCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self stm_rac_selectionSignalWithInput:input];
    }];
    return self;
}
- (RACSignal*) stm_rac_selectionSignalWithInput:(id) input {
    return  [RACSignal return:input];
    
}
@end



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