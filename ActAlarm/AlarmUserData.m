//
//  AlarmUserData.m
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import "AlarmUserData.h"

@implementation AlarmUserData

- (void)encodeWithCoder:(NSCoder*)coder {
	[coder encodeObject:self.date forKey:@"DATE"];
	[coder encodeObject:self.things forKey:@"THINGS"] ;
	[coder encodeObject:self.bestTimer forKey:@"BESTTIMER"] ;
	[coder encodeObject:self.betterTimer forKey:@"BETTERTIMER"] ;
	[coder encodeObject:self.worseTimer forKey:@"WORSETIMER"] ;
}

- (id)initWithCoder:(NSCoder*)coder {
	self.date = [coder decodeObjectForKey:@"DATE"];
	self.things = [coder decodeObjectForKey:@"THINGS"];
	self.bestTimer = [coder decodeObjectForKey:@"BESTTIMER"];
	self.betterTimer = [coder decodeObjectForKey:@"BETTERTIMER"];
	self.worseTimer = [coder decodeObjectForKey:@"WORSETIMER"];
	return self;
}

- (NSString*) getDateString{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]];
    [df setDateFormat:@"HH:mm"];
    
    NSString *dateStr = [df stringFromDate:self.date];
    
    return dateStr;
}


@end
