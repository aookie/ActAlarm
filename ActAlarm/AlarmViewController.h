//
//  ViewController.h
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/04/29.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmViewController : UIViewController{
    
    // progress timer
    NSTimer *timeTicker;
}

@property (weak, nonatomic) IBOutlet UIImageView *stopImage;
@property (weak, nonatomic) IBOutlet UILabel *todo;
@property (weak, nonatomic) IBOutlet UILabel *progressTime;

-(void)updateTimer;

@end
