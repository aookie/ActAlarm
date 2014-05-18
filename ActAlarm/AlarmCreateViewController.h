//
//  AlarmCreateViewController.h
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewCloseDelegate.h"

@interface AlarmCreateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet UITextField *thingsTextField;
@property (weak, nonatomic) IBOutlet UITextField *bestTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *betterTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *worseTimeTextField;

@property (weak, nonatomic) IBOutlet UITextField *whatTime;
@property (weak, nonatomic) IBOutlet UITextField *whatThing;
@property (weak, nonatomic) IBOutlet UITextField *bestTime;
@property (weak, nonatomic) IBOutlet UITextField *betterTime;
@property (weak, nonatomic) IBOutlet UITextField *worseTime;

@property (strong, nonatomic) id <ViewCloseDelegate> closeViewDelegate;

@end
