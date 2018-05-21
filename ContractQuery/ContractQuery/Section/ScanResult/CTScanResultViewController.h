//
//  CTScanResultViewController.h
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTBaseViewController.h"
#import "CTScanResultModel.h"

@interface CTScanResultViewController : UITableViewController
@property (nonatomic,strong) CTScanResultModel *viewModel;

@property (nonatomic, strong) IBOutlet UILabel *linkPhone_label;
@property (nonatomic, strong) IBOutlet UILabel *userName_label;
@property (nonatomic, strong) IBOutlet UILabel *retailName_label;
@property (nonatomic, strong) IBOutlet UILabel *contractNo_label;
@property (nonatomic, strong) IBOutlet UILabel *linkman_label;
@property (nonatomic, strong) IBOutlet UILabel *retailCity_label;
@property (nonatomic, strong) IBOutlet UILabel *updateTms_label;
@property (nonatomic, strong) IBOutlet UILabel *process_label;

@property (nonatomic, strong) NSString *codeString;

@end
