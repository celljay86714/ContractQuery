//
//  CTBaseViewController.m
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTBaseViewController.h"

@interface CTBaseViewController ()

@end

@implementation CTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)setNavTitle:(NSString *)title {
    
    UIColor *color = [UIColor blackColor];
    [self setNavTitle:title titleColor:color];
}


- (void)setNavTitle:(NSString *)title titleColor:(UIColor *)color {
    if ( _navTitleView == nil) {
        _navTitleView = [[UILabel alloc] init];
        _navTitleView.frame = CGRectMake(0, 0, 100, 40);
        if (color) {
            _navTitleView.textColor = color;
        }
        else
        {
            _navTitleView.textColor = [UIColor blackColor];
        }
        
        _navTitleView.textAlignment = NSTextAlignmentCenter;
    }
    _navTitleView.text = title;
    self.navigationItem.titleView = _navTitleView;
}


- (void)setNavLeftItemWithTitle:(NSString *)title imageStr:(NSString *)imageStr leftItemClickBlock:(LeftItemClickBlock)leftItemClickBlock {
    if (leftItemClickBlock) {
        self.leftItemClickBlock = leftItemClickBlock;
    }
    
    UIBarButtonItem *leftBarButtonItem;
    if (title) {
        leftBarButtonItem = [[UIBarButtonItem alloc]
                             initWithTitle:title
                             style:UIBarButtonItemStylePlain
                             target:self
                             action:@selector(navLeftItemClick:)];
    } else {
        UIImage *image = [UIImage imageNamed:imageStr];
        leftBarButtonItem = [[UIBarButtonItem alloc]
                             initWithImage:image
                             style:UIBarButtonItemStylePlain
                             target:self
                             action:@selector(navLeftItemClick:)];
    }
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)setNavRightItemWithTitle:(NSString *)title imageStr:(NSString *)imageStr rightItemClickBlock:(RightItemClickBlock)rightItemClickBlock {
    if (rightItemClickBlock) {
        self.rightItemClickBlock = rightItemClickBlock;
    }
    
    UIBarButtonItem *rightBarButtonItem;
    if (title) {
        rightBarButtonItem = [[UIBarButtonItem alloc]
                              initWithTitle:title
                              style:UIBarButtonItemStylePlain
                              target:self
                              action:@selector(navRightItemClick:)];
    } else {
        UIImage *image = [UIImage imageNamed:imageStr];
        rightBarButtonItem = [[UIBarButtonItem alloc]
                              initWithImage:image
                              style:UIBarButtonItemStylePlain
                              target:self
                              action:@selector(navRightItemClick:)];
    }
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)navLeftItemClick:(UIBarButtonItem *)sender {
    if (self.leftItemClickBlock) {
        self.leftItemClickBlock(sender);
    }
}

- (void)navRightItemClick:(UIBarButtonItem *)sender {
    if (self.rightItemClickBlock) {
        self.rightItemClickBlock(sender);
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
