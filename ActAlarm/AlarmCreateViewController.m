//
//  AlarmCreateViewController.m
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import "AlarmCreateViewController.h"

@interface AlarmCreateViewController (){
}

@end

@implementation AlarmCreateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveActivity:(id)sender {
    // check input
    if([self.timeTextField.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Input time"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil,nil];
        [alert show];
        return;
    }
    if([self.thingsTextField.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Input things"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil,nil];
        [alert show];
        return;
    }
    if([self.bestTimeTextField.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Input best time"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil,nil];
        [alert show];
        return;
    }
    if([self.betterTimeTextField.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Input better time"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil,nil];
        [alert show];
        return;
    }
    if([self.worseTimeTextField.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Input worse time"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil,nil];
        [alert show];
        return;
    }

    // prepare save data
    AlarmUserData* userData = [[AlarmUserData alloc] init];
    
    // date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterFullStyle];
    [formatter setDateFormat:@"HH:mm"];

    // TODO:get strings.
    userData.date = [formatter dateFromString:@"09:00"];
    
    // thing
    userData.things = self.whatThing.text;
    
    // time
    userData.bestTimer = self.bestTime.text;
    userData.betterTimer = self.betterTime.text;
    userData.worseTimer = self.worseTime.text;
    
    // save
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [delegate.dataManager appendData:userData];
    
    // back to setting view
    [self.closeViewDelegate didCloseView];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backToSetting:(id)sender {
    // back to setting view
    [self.closeViewDelegate didCloseView];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

