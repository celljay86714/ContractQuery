//
//  CTScanResultViewController.m
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTScanResultViewController.h"

@interface CTScanResultViewController ()

@end

@implementation CTScanResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.viewModel = [CTScanResultModel new];
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    [self.viewModel requestScanResultSuccess:^(id responseData) {
        
        [SVProgressHUD dismiss];
        
        self.linkPhone_label.text = self.viewModel.model.data.linkPhone;
        self.userName_label.text =  self.viewModel.model.data.userName;
        self.retailName_label.text = self.viewModel.model.data.retailName;
        self.contractNo_label.text = self.viewModel.model.data.contractNo;
        self.linkman_label.text =  self.viewModel.model.data.linkman;
        self.retailCity_label.text =  self.viewModel.model.data.retailCity;
        self.updateTms_label.text =  [NSString stringWithFormat:@"%f",self.viewModel.model.data.updateTms];
        self.process_label.text = self.viewModel.model.data.process;
        
    } faile:^(id responseData) {
        
        [SVProgressHUD showErrorWithStatus:@"服务器异常请重试"];

        
    }];
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
