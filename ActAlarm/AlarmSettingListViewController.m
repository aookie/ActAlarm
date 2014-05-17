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

    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];

    // get array
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    dataArray = [delegate.dataManager getData];
    
    [self.view addSubview:self.tableView];
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
//テーブルに含まれるセクションの数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//セクションに含まれる行の数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}
//行に表示するデータの生成
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	
    AlarmUserData* data = [dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = data.things;
    return cell;
}

- (IBAction)backToList:(id)sender {
    // back to list view
    [self dismissViewControllerAnimated:YES completion:nil];
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

@end
