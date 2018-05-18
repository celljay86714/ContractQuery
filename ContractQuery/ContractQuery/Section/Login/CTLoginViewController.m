//
//  CTLoginViewController.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTLoginViewController.h"

@interface CTLoginViewController ()

@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation CTLoginViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.mainScrollView.contentOffset = CGPointMake(0, 0);
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mainScrollView = [UIScrollView new];
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    self.titleLabel = [UILabel new];
    
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
