//
//  AlermListViewController.h
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/07.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlermListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
