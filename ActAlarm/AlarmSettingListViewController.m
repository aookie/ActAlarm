//
//  AlarmSettingListViewController.m
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/17.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import "AlarmSettingListViewController.h"

@interface AlarmSettingListViewController (){
    NSMutableArray* dataArray;
    UIActionSheet* uiActionSheet;
    UIAlertView* uiAlertView;
    enum KKAlarmSettingState state;
}

@end

@implementation AlarmSettingListViewController

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

    state = KKAlarmSettingInit;
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // set cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AlarmSettingListViewCell class]) bundle:nil]forCellReuseIdentifier:@"cell"];

    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.5; //seconds
    lpgr.delegate = self;
    [self.tableView addGestureRecognizer:lpgr];
    
    // get array
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    dataArray = [delegate.dataManager getData];
    
    [self.view addSubview:self.tableView];
    
    // alloc Ctrls
    uiActionSheet = [[UIActionSheet alloc] init];
    uiActionSheet.delegate = self;
    [uiActionSheet addButtonWithTitle:@"Edit"];
    [uiActionSheet addButtonWithTitle:@"Delete"];
    [uiActionSheet addButtonWithTitle:@"Cancel"];
    uiActionSheet.cancelButtonIndex = 2;
    uiActionSheet.destructiveButtonIndex = 0;
    
    uiAlertView = [[UIAlertView alloc]init];
    uiAlertView.delegate = self;
    uiAlertView.title = @"Delete";
    uiAlertView.message = @"delete alarm item ?";
    [uiAlertView addButtonWithTitle:@"No"];
    [uiAlertView addButtonWithTitle:@"Yes"];
    
    state = KKAlarmSettingShowList;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - UITableViewDelegate, UITableViewDataSource

// テーブルに含まれるセクションの数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// セクションに含まれる行の数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

// 行に表示するデータの生成
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AlarmUserData* data = [dataArray objectAtIndex:indexPath.row];

    AlarmSettingListViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.time.text = [data getDateString];
    cell.title.text = data.things;
    cell.checkbox.on = data.enabled;
    return cell;
}

- (IBAction)backToList:(id)sender {
    // back to list view
    [self dismissViewControllerAnimated:YES completion:nil];
    
    state = KKAlarmSettingShowList;
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    
    // 対象セグエ以外ならここでリターン
    if(![[segue identifier] isEqualToString:@"CreateSetting"])
        return;
    
    // 遷移先コントローラを取得
    AlarmCreateViewController *alarmCreateViewController
    = (AlarmCreateViewController*)[segue destinationViewController];
    
    // 遷移元ポインタを渡しておく
    alarmCreateViewController.closeViewDelegate = self;
}

#pragma mark - ViewCloseDelegate
- (void)didCloseView{
    [self.tableView reloadData];
}

#pragma mark - LongPress Delegate
-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if(state == KKAlarmSettingShowActionSheet)
    {
        return;
    }
    
    CGPoint p = [gestureRecognizer locationInView:self.tableView];
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    if (indexPath == nil){
        NSLog(@"long press on table view but not on a row");
    }else{
        
        state = KKAlarmSettingShowActionSheet;
        
        // exist rows.
        uiActionSheet.tag = indexPath.row;
        
        [uiActionSheet showInView:self.view];
        
        NSLog(@"long press on table view at row %ld", (long)indexPath.row);
    }
}

#pragma mark - UIActionSheet Delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(state == KKAlarmSettingShowAlert)
    {
        return;
    }
    
    AlarmCreateViewController *createView = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateSetting"];
    
    switch (buttonIndex) {
        case 0:
            // Edit
            state = KKAlarmSettingShowList;

            [self presentViewController:createView animated:YES completion:nil];
            break;
        case 1:
            
            state = KKAlarmSettingShowAlert;
            
            // Delete
            uiAlertView.tag = actionSheet.tag;
            
            [uiAlertView show];
            break;
        default:
            break;
    }
}

# pragma mark - UIAlert Delegate
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    // save
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    switch (buttonIndex) {
        case 0:
            // No
            break;
        case 1:
            // yes
            [delegate.dataManager removeData:alertView.tag];
            break;
        default:
            break;
    }
    
    state = KKAlarmSettingShowList;
}

@end
