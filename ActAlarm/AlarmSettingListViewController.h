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

@interface AlarmSettingListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ViewCloseDelegate>{
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
