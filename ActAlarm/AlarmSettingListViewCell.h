//
//  AlarmSettingListViewCell.h
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/07/06.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmSettingListViewCell : UITableViewCell

// property
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UISwitch *checkbox;

@end
