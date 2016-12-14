//
//  TransitionManager.h
//  Unity
//
//  Created by mgfjx on 2016/12/12.
//  Copyright © 2016年 XXL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TransitionType) {
    TransitionTypePresent,
    TransitionTypeDismiss,
    TransitionTypePush,
    TransitionTypePop
};

@interface TransitionManager : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(TransitionType)type forController:(UIViewController *)controller;
- (instancetype)initWithTransitionType:(TransitionType)type forController:(UIViewController *)controller;

@end
