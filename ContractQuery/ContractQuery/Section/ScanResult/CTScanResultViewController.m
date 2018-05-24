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

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];

//    [self.navigationController setNavigationBarHidden:YES];
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.navigationItem setHidesBackButton:YES];
    
    self.viewModel = [CTScanResultModel new];
    self.viewModel.codeString = self.codeString;
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    [self.viewModel requestScanResultSuccess:^(id responseData) {
        
        [SVProgressHUD dismiss];
        
        self.linkPhone_label.text = self.viewModel.model.data.linkPhone;
        self.userName_label.text =  self.viewModel.model.data.userName;
        self.retailName_label.text = self.viewModel.model.data.retailName;
        self.contractNo_label.text = self.viewModel.model.data.contractNo;
        self.linkman_label.text =  self.viewModel.model.data.linkman;
        self.retailCity_label.text =  self.viewModel.model.data.retailCity;
        self.process_label.text = self.viewModel.model.data.process;
        
//        NSString *updateTms = [NSString stringWithFormat:@"%f",self.viewModel.model.data.updateTms*1000];
        double updateTms = self.viewModel.model.data.updateTms/1000;
    
        NSDate *sinceTime = [NSDate dateWithTimeIntervalSince1970:updateTms];
        
//        NSDate *sinceTime = [NSDate dateWithTimeIntervalSinceNow:self.viewModel.model.data.updateTms];
        
        NSString *time = [sinceTime uxy_stringWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        self.updateTms_label.text = time;
        
        
    } faile:^(id responseData) {
        
        [SVProgressHUD dismiss];

        if ([responseData isKindOfClass:[NSError class]])
        {
            NSError *error = (NSError *)responseData;
    //        [SVProgressHUD showErrorWithStatus:@"服务器异常请重试"];
            [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
        }
        else
        {
            NSDictionary *dic = (NSDictionary *)responseData;
            NSString *message = dic[@"message"];
            [SVProgressHUD showErrorWithStatus:message];
        }
    }];
    
    [self.button addTarget:self action:@selector(buttonseleted:) forControlEvents:UIControlEventTouchUpInside];
    
    self.footView.frame =  CGRectMake(0, 0, CGRectGetWidth(self.footView.frame), ([UIScreen mainScreen].bounds.size.height-355));
}


-(void)buttonseleted:(UIButton *)button{
    
    [self.navigationController popViewControllerAnimated:YES];
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
