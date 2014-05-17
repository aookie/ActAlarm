//
//  AlarmUserDataManager.m
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import "AlarmUserDataManager.h"

@implementation AlarmUserDataManager{
    NSUserDefaults* defaults;
    NSMutableArray* userDataArray;     // AlarmUserData array
}

- (id) init{
    self = [super init];
    
	if (self != nil) {
		defaults =  [NSUserDefaults standardUserDefaults];

        // load userDefault
        userDataArray = (NSMutableArray *)[defaults arrayForKey:@"dataArray"];
        if(!userDataArray){
            userDataArray = [[NSMutableArray alloc]init];
            [self updateUserDefault];
        }
	}
    
	return self;
}

- (void) appendData:(AlarmUserData*)userData{
    // append
    [userDataArray addObject:userData];
    // update userDefault
    [self updateUserDefault];
}

- (void) updateData:(NSInteger)index data:(AlarmUserData*)userData{
    // replace
    [userDataArray replaceObjectAtIndex:index withObject:userData];
    // update userDefault
    [self updateUserDefault];
}

- (void) removeData:(NSInteger)index{
    // remove(index)
    [userDataArray removeObjectAtIndex:index];
    // update userDefault
    [self updateUserDefault];
}

- (NSMutableArray*) getData{
    // get
    return userDataArray;
}

- (AlarmUserData*) getDataAtIndex:(NSInteger)index{
    // get(index)
    return [userDataArray objectAtIndex:index];
}

# pragma mark - internal
- (void) updateUserDefault{
    // save userDefault
    NSData* userDataSave = [NSKeyedArchiver archivedDataWithRootObject:userDataArray];
    [defaults setObject:userDataSave forKey:@"dataArray"];
    
    // synchronize
    if ( ![defaults synchronize] ) {
        NSLog( @"failed ..." );
    }
    // load userDefault
    NSData* userDataLoad = [defaults dataForKey:@"dataArray"];
    userDataArray = (NSMutableArray*)[NSKeyedUnarchiver unarchiveObjectWithData:userDataLoad];
}

@end
