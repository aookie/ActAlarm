//
//  ViewController.m
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/04/29.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import "AlarmViewController.h"

@interface AlarmViewController ()

@end

@implementation AlarmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // set image
    [_stopImage setImage:[UIImage imageNamed:@"unchecked"]];
	
    // timer start
    timeTicker = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                target:self
                                                selector:@selector(updateTimer)
                                                userInfo:nil
                                                repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateTimer
{
    float currentTime = [_progressTime.text floatValue];
    float displayTime = currentTime + 0.01;
    
    // TODO:1分過ぎたら桁増やしたり表示の調整が必要
    
    _progressTime.text = [NSString stringWithFormat:@"%.2f", displayTime];
}

@end
