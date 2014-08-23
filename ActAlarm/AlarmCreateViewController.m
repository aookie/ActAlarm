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
    
    self.thingsTextField.delegate = self;
    self.timeTextField.delegate = self;
    self.bestTimeTextField.delegate = self;
    self.betterTimeTextField.delegate = self;
    self.worseTimeTextField.delegate = self;
    
    // set the view scroll size
    [_scrollView setContentSize:_contentsView.frame.size];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //キーボード表示・非表示の通知の開始
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    //キーボード表示・非表示の通知を終了
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
- (void)keyboardWillShow:(NSNotification *)ns {
    
    // キーボードのCGRect
    CGRect keyboardRect = [[[ns userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardRect.size.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardRect.size.height;
    if (_activeTextField != nil) {
        CGPoint scrollPoint = CGPointMake(0.0, _activeTextField.frame.origin.y - 30);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
}

- (void)keyboardWillHide:(NSNotification *)ns {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
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

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    _activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    _activeTextField = nil;
}

@end

