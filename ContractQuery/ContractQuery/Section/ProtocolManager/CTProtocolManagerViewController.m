//
//  CTProtocolManagerViewController.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTProtocolManagerViewController.h"
#import "CTProtocolManagerTableViewCell.h"
#import "CTProtocolManagerDetailViewController.h"
#import <SGQRCode/SGQRCode.h>

@interface CTProtocolManagerViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *protocolManagerTableView;
@property (nonatomic, strong) NSMutableArray *protocolManagerArray;
@end

@implementation CTProtocolManagerViewController


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavTitle:@"商户保理协议管理"];
    [self.navigationController.navigationBar setBarTintColor:kRGBACOLOR(44, 173, 76, 1.0)];
    
    self.view.backgroundColor = kRGBACOLOR(207, 207, 207, 1.0);
    self.protocolManagerTableView = [UITableView new];
    self.protocolManagerTableView.dataSource = self;
    self.protocolManagerTableView.delegate = self;
    self.protocolManagerTableView.backgroundColor = kRGBACOLOR(207, 207, 207, 1.0);
    [self.view addSubview:self.protocolManagerTableView];
    [self.protocolManagerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.protocolManagerTableView registerClass:[CTProtocolManagerTableViewCell class] forCellReuseIdentifier:@"CTProtocolManagerTableViewCell"];
    
    self.protocolManagerTableView.tableFooterView = [[UIView alloc] init];
    
    self.protocolManagerArray = [NSMutableArray array];
    
    NSArray *imageNameArray = [NSArray arrayWithObjects:@"scan_upload",@"scan_query", nil];
    NSArray *titleArray = [NSArray arrayWithObjects:@"协议进展",@"商户查询", nil];
    for (NSInteger i = 0; i < 2; i++) {
        NSString *imageName = imageNameArray[i];
        NSString *title = titleArray[i];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:imageName forKey:@"imageName"];
        [dic setObject:title forKey:@"title"];
        [self.protocolManagerArray addObject:dic];
    }
    
    [self.protocolManagerTableView reloadData];

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.protocolManagerArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CTProtocolManagerTableViewCell";
    //从队列中取出单元格
    CTProtocolManagerTableViewCell *cell = [self.protocolManagerTableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    //为单元格的label设置数据
    NSDictionary *dic = self.protocolManagerArray[indexPath.row];
    [cell updateCellWithDictionary:dic];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            CTProtocolManagerDetailViewController *view = [[CTProtocolManagerDetailViewController alloc] init];
            [self.navigationController pushViewController:view animated:YES];
            
            
        }
            break;
        case 1:
        {
            CTProtocolManagerDetailViewController *view = [[CTProtocolManagerDetailViewController alloc] init];
            [self.navigationController pushViewController:view animated:YES];
        }
            break;
            
        default:
            break;
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
