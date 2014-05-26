//
//  AlarmCreateViewController.m
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import "AlarmCreateViewController.h"

@interface AlarmCreateViewController (){
    CGRect orgRect;
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
    
    self.thingsTextField.delegate = self;
    self.timeTextField.delegate = self;
    self.bestTimeTextField.delegate = self;
    self.betterTimeTextField.delegate = self;
    self.worseTimeTextField.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(respondToKeyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(respondToKeyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    orgRect = self.createView.frame;
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

#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - UITextField Show/Hide Notification
- (void)respondToKeyboardWillShow:(NSNotification *)ns {
    
    NSDictionary *dic = [ns userInfo];
    
    //アニメーション終了時のキーボードのCGRect
    CGRect keyboardRect = [[dic objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //アニメーションにかかる時間
    NSTimeInterval duration = [[dic objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //アニメーションのタイプ
    UIViewAnimationCurve curve  = [[dic objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    void (^animations)(void);
    animations = ^(void) {
        self.createView.frame = CGRectMake(self.createView.frame.origin.x,
                                           self.createView.frame.origin.y - keyboardRect.size.height,
                                           self.createView.frame.size.width,
                                           self.createView.frame.size.height);
    };
    
    [UIView animateWithDuration:duration
                          delay:0.0f
                        options:(curve << 16)
                     animations:animations
                     completion:nil];
}

- (void)respondToKeyboardWillHide:(NSNotification *)ns {
    
    void (^animations)(void);
    animations = ^(void) {
        self.createView.frame = CGRectMake(orgRect.origin.x,
                                           orgRect.origin.y,
                                           orgRect.size.width,
                                           orgRect.size.height);
    };
}


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
    userData.things = self.thingsTextField.text;
    
    // time
    userData.bestTimer = self.bestTimeTextField.text;
    userData.betterTimer = self.betterTimeTextField.text;
    userData.worseTimer = self.worseTimeTextField.text;
    
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

