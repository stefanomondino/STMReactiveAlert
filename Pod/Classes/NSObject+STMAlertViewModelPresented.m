//
//  NSObject+STMAlertViewModelPresented.m
//  Pods
//
//  Created by Stefano Mondino on 12/01/16.
//
//

#import "NSObject+STMAlertViewModelPresented.h"

@implementation NSObject (STMAlertViewModelPresented)
@dynamic stm_storyboardName,stm_rac_selectionCommand,stm_storyboardSceneIdentifier;

- (instancetype)stm_alertViewModel_init {
    @weakify(self);
    self.stm_rac_selectionCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self stm_rac_selectionSignalWithInput:input];
    }];
    return self;
}
- (RACSignal*) stm_rac_selectionSignalWithInput:(id) input {
    return  [RACSignal return:input];
    
}
@end
