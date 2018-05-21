//
//  CTStateListViewController.h
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTBaseViewController.h"
#import "CTStateListViewModel.h"

typedef void (^ControllerCallback)(id responseData);


@interface CTStateListViewController : CTBaseViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong)CTStateListViewModel *viewModel;

@property (nonatomic, copy)ControllerCallback callBack;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
