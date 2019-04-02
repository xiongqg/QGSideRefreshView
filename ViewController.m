//
//  ViewController.m
//  QGSideRefreshView
//
//  Created by cdc on 2019/4/2.
//  Copyright © 2019 QG. All rights reserved.
//

#import "ViewController.h"
#import "QGSideRefreshCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr=[NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1", nil];
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:tableView];
    tableView.sectionIndexColor = [UIColor colorWithRed:200/255 green:200/255 blue:200/255 alpha:1];
    tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
    tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView = tableView;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identifierstring = @"QGSideRefreshCell";
    QGSideRefreshCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierstring];
    if (cell == nil) {
        cell = [[QGSideRefreshCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierstring];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    if (self.dataArr!=nil&&self.dataArr.count>0) {
        [cell setCelldataWithArr:self.dataArr ];
    }
    cell.obtainMoreDataBlock = ^{
    };
    cell.indexDetail = ^(NSInteger index) {
       
    };
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 250;
}

@end
