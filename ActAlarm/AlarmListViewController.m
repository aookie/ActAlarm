//
//  AlarmListViewController.m
//  ActAlarm
//
//  Created by Masakazu Aoki on 2014/05/07.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import "AlarmListViewController.h"

@interface AlarmListViewController (){
    
}
@end

@implementation AlarmListViewController

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
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    // Viewが表示される直前に実行される
    // データのリロード、選択行の解除
    NSIndexPath* selection = [self.tableView indexPathForSelectedRow];
    if(selection){
        [self.tableView deselectRowAtIndexPath:selection animated:YES];
    }
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    //Viewが表示された直後に実行される
    // スクロールバーの点滅
    [self.tableView flashScrollIndicators];
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
    return 50;
}
//行に表示するデータの生成
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %li", @"row", (long)indexPath.row];
    return cell;
}

@end
