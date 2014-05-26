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

@interface AlarmCreateViewController : UIViewController <UITextFieldDelegate>

#pragma mark - delegate
@property (strong, nonatomic) id <ViewCloseDelegate> closeViewDelegate;

#pragma mark - property
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet UITextField *thingsTextField;
@property (weak, nonatomic) IBOutlet UITextField *bestTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *betterTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *worseTimeTextField;

@property (strong, nonatomic) IBOutlet UIView *createView;

@end
