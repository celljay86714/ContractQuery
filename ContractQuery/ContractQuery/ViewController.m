//
//  ViewController.m
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "ViewController.h"
#import "CTStateListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   UIStoryboard *storyBoard= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CTStateListViewController *viewController =[storyBoard instantiateViewControllerWithIdentifier:@"CTStateListViewController"];
    
    
    [self.view addSubview:viewController.view];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
