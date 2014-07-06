//
//  AlarmSettingListViewController.h
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewCloseDelegate.h"
#import "AlarmCreateViewController.h"
#import "AlarmSettingListViewCell.h"

@interface AlarmSettingListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ViewCloseDelegate, UIGestureRecognizerDelegate, UIActionSheetDelegate>{
}

enum KKAlarmSettingState{
    KKAlarmSettingInit = 0,
    KKAlarmSettingShowList,
    KKAlarmSettingShowActionSheet,
    KKAlarmSettingShowAlert
};


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
