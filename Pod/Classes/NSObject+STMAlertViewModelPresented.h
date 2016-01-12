//
//  NSObject+STMAlertViewModelPresented.h
//  Pods
//
//  Created by Stefano Mondino on 12/01/16.
//
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"

@protocol STMAlertViewModelProtocol <NSObject>
@required
@property (strong, nonatomic) NSString *stm_storyboardName;
@property (strong, nonatomic) NSString *stm_storyboardSceneIdentifier;
@property (strong, nonatomic) RACCommand* stm_rac_selectionCommand;
@end





@interface NSObject(STMAlertViewModelPresented)<STMAlertViewModelProtocol>
- (instancetype)stm_alertViewModel_init;
- (RACSignal*) stm_rac_selectionSignalWithInput:(id) input;
@end


