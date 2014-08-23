//
//  AppDelegate.h
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/04/29.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmUserDataManager.h"
#import "AlarmViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AlarmUserDataManager* dataManager;

@end
