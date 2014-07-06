//
//  AlarmUserData.h
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmUserData : NSObject<NSCoding>

@property (nonatomic,strong) NSDate* date;
@property (nonatomic,strong) NSString* things;
@property (nonatomic,strong) NSString* bestTimer;
@property (nonatomic,strong) NSString* betterTimer;
@property (nonatomic,strong) NSString* worseTimer;
@property (nonatomic,assign) BOOL enabled;

// method
- (NSString*) getDateString;

@end
