//
//  CTLoginViewController.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTLoginViewController.h"
#import "CTProtocolManagerViewController.h"
#import "CTLoginBaseClass.h"

@interface CTLoginViewController ()<UITextFieldDelegate>{
    CGFloat keyboardHeight;
    UITextField *firstTextField;
}

@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *userNameTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UILabel *versionLabel;
@property (nonatomic, strong)CTLoginBaseClass *model;
@end

@implementation CTLoginViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    self.mainScrollView.contentOffset = CGPointMake(0, 0);
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kRGBACOLOR(207, 207, 207, 1.0);
    self.mainScrollView = [UIScrollView new];
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mainScrollViewClick:)];
    [self.mainScrollView addGestureRecognizer:tap];
    
    
    UIView *contentView = [UIView new];
    [self.mainScrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self.mainScrollView);
        make.width.equalTo(self.mainScrollView);
    }];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"协议扫描";
    self.titleLabel.font = [UIFont systemFontOfSize:28];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.mainScrollView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mainScrollView).mas_offset(50);
        make.left.mas_equalTo(self.mainScrollView);
        make.right.mas_equalTo(self.mainScrollView);
        make.height.mas_equalTo(56);
    }];
    
    
    UIView *loginView = [UIView new];
    loginView.backgroundColor = [UIColor whiteColor];
    loginView.layer.cornerRadius = 5;
    [self.mainScrollView addSubview:loginView];
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(140);
        make.left.mas_equalTo(self.mainScrollView).mas_offset(48);
        make.right.mas_equalTo(self.mainScrollView).mas_offset(-48);
        make.height.mas_equalTo(100);
    }];
    
    UILabel *userNameLabel = [UILabel new];
    userNameLabel.text = @"账号：";
    userNameLabel.textAlignment = NSTextAlignmentRight;
    [loginView addSubview:userNameLabel];
    [userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginView);
        make.left.mas_equalTo(loginView);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(49);
    }];
    
    
    self.userNameTextField = [UITextField new];
    self.userNameTextField.placeholder = @"请输入账号";
    self.userNameTextField.text = @"A000001";
    self.userNameTextField.delegate = self;
    [loginView addSubview:self.userNameTextField];
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginView);
        make.left.mas_equalTo(userNameLabel.mas_right);
        make.right.mas_equalTo(loginView);
        make.height.mas_equalTo(49);
    }];
    
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = kRGBACOLOR(207, 207, 207, 1.0);
    [loginView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userNameLabel.mas_bottom);
        make.left.mas_equalTo(loginView);
        make.right.mas_equalTo(loginView);
        make.height.mas_equalTo(1);
    }];
    
    
    UILabel *passwordLabel = [UILabel new];
    passwordLabel.text = @"密码：";
    passwordLabel.textAlignment = NSTextAlignmentRight;
    [loginView addSubview:passwordLabel];
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom);
        make.left.mas_equalTo(loginView);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(49);
    }];
    
    
    self.passwordTextField = [UITextField new];
    self.passwordTextField.placeholder = @"请输入密码";
    self.passwordTextField.text = @"123456";
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.delegate = self;
    [loginView addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordLabel);
        make.left.mas_equalTo(passwordLabel.mas_right);
        make.right.mas_equalTo(loginView);
        make.height.mas_equalTo(49);
    }];
    
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.backgroundColor = kRGBACOLOR(44, 173, 76, 1.0);
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.loginBtn.layer.cornerRadius = 5;
    [self.loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainScrollView addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginView.mas_bottom).mas_offset(20);
        make.left.mas_equalTo(self.mainScrollView).mas_offset(48);
        make.right.mas_equalTo(self.mainScrollView).mas_offset(-48);
        make.height.mas_equalTo(54);
    }];
    
    
    self.versionLabel = [UILabel new];
    self.versionLabel.text = @"V1.1";
    self.versionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.versionLabel];
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).mas_offset(-20);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
}


- (void)loginBtnClick:(UIButton *)sender
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"Rgr&574@65HBq3Gp$m2exytWQ263X!$" forKey:@"accessKey"];
    [parameters setObject:self.userNameTextField.text forKey:@"userId"];
    [parameters setObject:self.passwordTextField.text forKey:@"password"];

    [DigApiRequestManager requestLoginWithInfo:parameters header:nil resultCallback:^(BOOL success, NSDictionary *responseData, NSError *error) {

        NSLog(@"----------%@,%@",responseData,error);
        if (success) {

            self.model = [CTLoginBaseClass modelObjectWithDictionary:responseData];
            [CTUserManager sharedInstance].userId = responseData[@"data"][@"userId"];
            [CTUserManager sharedInstance].userName = responseData[@"data"][@"userName"];
//
//            if (block) {
//                block(self.model);
//            }
            CTProtocolManagerViewController *view = [[CTProtocolManagerViewController alloc] init];
            [self.navigationController pushViewController:view animated:YES];
        }
        else{

//            if (faileBlock) {
//                faileBlock(error);
//            }

        }


    }];


}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.mainScrollView.contentOffset = CGPointMake(0, 0);
    self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height);
    [UIView commitAnimations];
    return YES;
}


- (void)mainScrollViewClick:(UITapGestureRecognizer *)sender
{
    [self.userNameTextField endEditing:YES];
    [self.passwordTextField endEditing:YES];
}

#pragma mark - Keyboard Observer

- (void)keyboardWasShown:(NSNotification *) notif {
    NSDictionary *info = [notif userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    
    keyboardHeight = keyboardSize.height;
    NSLog(@"keyBoard:%f", keyboardSize.height);  //216
    ///keyboardWasShown = YES;
    CGRect frame = firstTextField.frame;
    int offset = frame.origin.y + 72+44+30 - (self.view.frame.size.height - keyboardHeight);//键盘高度216
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    if (offset>0) {
        self.mainScrollView.contentOffset = CGPointMake(0, offset);
        self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height+offset+50);
    }
    [UIView commitAnimations];
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
