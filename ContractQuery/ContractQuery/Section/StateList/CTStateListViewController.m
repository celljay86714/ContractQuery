//
//  CTStateListViewController.m
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTStateListViewController.h"
#import "CTStateListCell.h"

@interface CTStateListViewController ()

@property (nonatomic, strong) CTStateListCell *stateCell;
@end

@implementation CTStateListViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:kRGBACOLOR(44, 173, 76, 1.0)];
    
    //    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.tableView registerClass:[CTStateListCell class] forCellReuseIdentifier:@"StateListCell"];
    
    self.viewModel = [CTStateListViewModel new];
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    [self.viewModel requestStateListSuccess:^(id responseData) {
        
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
        
    } faile:^(id responseData) {
        
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger a = self.viewModel.model.data.count;
    
    return a;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   return  [tableView fd_heightForCellWithIdentifier:@"StateListCell" configuration:^(CTStateListCell * cell) {
       
       CTStateListData *subData=self.viewModel.model.data[indexPath.row];
       cell.labelTitle =subData.processName;
    }];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    self.stateCell = [tableView dequeueReusableCellWithIdentifier:@"StateListCell"];
    
    CTStateListData *subData=self.viewModel.model.data[indexPath.row];
    self.stateCell.labelTitle= subData.processName;
    
    return self.stateCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CTStateListData *subData=self.viewModel.model.data[indexPath.row];
//    NSString *codeString  =   subData.processId;
    
    
    if (self.callBack) {
        self.callBack(subData);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
