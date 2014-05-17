//
//  AlarmUserDataManager.h
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlarmUserData.h"

@interface AlarmUserDataManager : NSObject

// CRUD
- (void) appendData:(AlarmUserData*)userData;
- (void) updateData:(NSInteger)index data:(AlarmUserData*)userData;
- (void) removeData:(NSInteger)index;
- (NSMutableArray*) getData;
- (AlarmUserData*) getDataAtIndex:(NSInteger)index;

@end
