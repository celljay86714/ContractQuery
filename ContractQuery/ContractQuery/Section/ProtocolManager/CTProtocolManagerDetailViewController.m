//
//  CTProtocolManagerDetailViewController.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTProtocolManagerDetailViewController.h"
#import <SGQRCode/SGQRCode.h>
//#import "ScanSuccessJumpVC.h"
#import "CTBottomView.h"
#import "CTStateListViewController.h"
#import "CTScanResultViewController.h"
#import "CTStateListData.h"
#import "CTScanResultViewController.h"
#import "CTProtocolManagerDetailBaseClass.h"

@interface CTProtocolManagerDetailViewController ()<SGQRCodeScanManagerDelegate, SGQRCodeAlbumManagerDelegate>

@property (nonatomic, strong) SGQRCodeScanManager *manager;
@property (nonatomic, strong) SGQRCodeScanningView *scanningView;
@property (nonatomic, strong) UILabel *promptLabel;
@property (nonatomic, strong) CTStateListData *stateListData;
@property (nonatomic, strong) NSString *result;
@property (nonatomic, strong) CTBottomView *bottomView;
@property (nonatomic, strong) CTProtocolManagerDetailBaseClass *model;
@end

@implementation CTProtocolManagerDetailViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.scanningView addTimer];
    [_manager startRunning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.scanningView removeTimer];
}

- (void)dealloc {
    NSLog(@"WBQRCodeScanningVC - dealloc");
    [self removeScanningView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    [self setNavLeftItemWithTitle:nil imageStr:@"arrow_bac" leftItemClickBlock:^(UIBarButtonItem *leftItem){
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"协议进展",@"商户查询", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:titleArray];
    
    segmentedControl.frame = CGRectMake(0, 0, 180, 30);
    
    segmentedControl.selectedSegmentIndex = self.index;
    segmentedControl.tintColor = kRGBACOLOR(45, 178, 78, 1.0);
    
    [segmentedControl addTarget:self action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    [self.navigationItem setTitleView:segmentedControl];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.scanningView];
    [self setupQRCodeScanning];
    [self.view addSubview:self.promptLabel];
    [self addBottomView];
}

- (void)addBottomView
{
    self.bottomView = [[CTBottomView alloc] initWithFrame:CGRectMake(0, kMainScreenHeight-64-64, kMainScreenWidth, 64)];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) weakSelf = self;
    self.bottomView.bottomViewClickBlock = ^(){
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CTStateListViewController *viewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"CTStateListViewController"];
        
        
        [weakSelf.navigationController pushViewController:viewController animated:YES];
        
        
        viewController.callBack = ^(id responseData) {
            
            weakSelf.stateListData = responseData;
//            [weakSelf.bottomView.stateBtn setTitle:weakSelf.stateListData.processName forState:UIControlStateNormal];
            [weakSelf.bottomView updateStateLabelWithText:weakSelf.stateListData.processName];
            //request
            
            
        };
    };
    [self.view addSubview:self.bottomView];
}


-(void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender
{
    //我定义了一个 NSInteger tag，是为了记录我当前选择的是分段控件的左边还是右边。
    NSInteger selectIndex = sender.selectedSegmentIndex;
    self.index = selectIndex;
    
    switch (selectIndex) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        default:
            break;
    }
}



- (SGQRCodeScanningView *)scanningView {
    if (!_scanningView) {
        _scanningView = [[SGQRCodeScanningView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scanningView.scanningImageName = @"SGQRCode.bundle/QRCodeScanningLineGrid";
        _scanningView.scanningAnimationStyle = ScanningAnimationStyleGrid;
        _scanningView.cornerColor = [UIColor orangeColor];
    }
    return _scanningView;
}
- (void)removeScanningView {
    [self.scanningView removeTimer];
    [self.scanningView removeFromSuperview];
    self.scanningView = nil;
}

- (void)rightBarButtonItenAction {
    SGQRCodeAlbumManager *manager = [SGQRCodeAlbumManager sharedManager];
    [manager readQRCodeFromAlbumWithCurrentController:self];
    manager.delegate = self;
    
    if (manager.isPHAuthorization == YES) {
        [self.scanningView removeTimer];
    }
}

- (void)setupQRCodeScanning {
    self.manager = [SGQRCodeScanManager sharedManager];
    NSArray *arr = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    // AVCaptureSessionPreset1920x1080 推荐使用，对于小型的二维码读取率较高
    [_manager setupSessionPreset:AVCaptureSessionPreset1920x1080 metadataObjectTypes:arr currentController:self];
    [_manager cancelSampleBufferDelegate];
    _manager.delegate = self;
}

#pragma mark - - - SGQRCodeAlbumManagerDelegate
- (void)QRCodeAlbumManagerDidCancelWithImagePickerController:(SGQRCodeAlbumManager *)albumManager {
    [self.view addSubview:self.scanningView];
}
- (void)QRCodeAlbumManager:(SGQRCodeAlbumManager *)albumManager didFinishPickingMediaWithResult:(NSString *)result {
    if ([result hasPrefix:@"http"]) {
//        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
//        jumpVC.comeFromVC = ScanSuccessJumpComeFromWB;
//        jumpVC.jump_URL = result;
//        [self.navigationController pushViewController:jumpVC animated:YES];
        
    } else {
//        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
//        jumpVC.comeFromVC = ScanSuccessJumpComeFromWB;
//        jumpVC.jump_bar_code = result;
//        [self.navigationController pushViewController:jumpVC animated:YES];
    }
}
- (void)QRCodeAlbumManagerDidReadQRCodeFailure:(SGQRCodeAlbumManager *)albumManager {
    NSLog(@"暂未识别出二维码");
}

#pragma mark - - - SGQRCodeScanManagerDelegate
- (void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager didOutputMetadataObjects:(NSArray *)metadataObjects {
    NSLog(@"metadataObjects - - %@", metadataObjects);
    if (metadataObjects != nil && metadataObjects.count > 0) {
//        [scanManager playSoundName:@"SGQRCode.bundle/sound.caf"];
        [scanManager stopRunning];
        
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
//        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
//        jumpVC.comeFromVC = ScanSuccessJumpComeFromWB;
//        jumpVC.jump_URL = [obj stringValue];
//        [self.navigationController pushViewController:jumpVC animated:YES];
        self.result = [obj stringValue];
        
        if (self.index == 0) {
            NSString *codeString = self.stateListData.processId;
            if (codeString) {
                [self changeReceiveInfoRequest];
                
            }
            else
            {
                
                UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CTStateListViewController *viewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"CTStateListViewController"];
                
                
                [self.navigationController pushViewController:viewController animated:YES];
                
                
                viewController.callBack = ^(id responseData) {
                    
                    self.stateListData = responseData;
                    
                    //request
                    [self changeReceiveInfoRequest];
                    
                };
            }
        }
        else if (self.index == 1)
        {
            
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            CTScanResultViewController *viewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"CTScanResultViewController"];
            NSArray *numArray = [self.result componentsSeparatedByString:@","];
            viewController.codeString = numArray[0];
            
            [self.navigationController pushViewController:viewController animated:YES];
        }
        
        
        
    } else {
        NSLog(@"暂未识别出扫描的二维码");
    }
}

- (void)changeReceiveInfoRequest
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"Rgr&574@65HBq3Gp$m2exytWQ263X!$" forKey:@"accessKey"];
    NSArray *numArray = [self.result componentsSeparatedByString:@","];
    NSLog(@"%@",self.result);
    [parameters setObject:numArray[1] forKey:@"contractNo"];
    
    
    [parameters setObject:numArray[0] forKey:@"aplyId"];
    
    NSString *codeString = self.stateListData.processId;
    [parameters setObject:codeString forKey:@"processId"];
    
    NSString *userId = [CTUserManager sharedInstance].userId;
    [parameters setObject:userId forKey:@"userId"];

    [DigApiRequestManager requestPostStateWithInfo:parameters header:nil resultCallback:^(BOOL success, NSDictionary *responseData, NSError *error) {

        NSLog(@"----------%@,%@",responseData,error);
        
        if (success) {

            self.model = [CTProtocolManagerDetailBaseClass modelObjectWithDictionary:responseData];
            
            NSString *message = self.model.message;
            [SVProgressHUD showInfoWithStatus:message];
            
            [_manager startRunning];
            //            self.model = [CTScanResultBaseClass modelObjectWithDictionary:responseData];
            //
            //            if (block) {
            //                block(self.model);
            //            }

        }
        else{

            self.model = [CTProtocolManagerDetailBaseClass modelObjectWithDictionary:responseData];
            
            NSString *message = self.model.message;
            [SVProgressHUD showErrorWithStatus:message];
            
            [_manager startRunning];
            //            if (faileBlock) {
            //                faileBlock(error);
            //            }

        }


    }];
}

- (UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.backgroundColor = [UIColor clearColor];
        CGFloat promptLabelX = 0;
        CGFloat promptLabelY = 0.73 * self.view.frame.size.height-64;
        CGFloat promptLabelW = self.view.frame.size.width;
        CGFloat promptLabelH = 25;
        _promptLabel.frame = CGRectMake(promptLabelX, promptLabelY, promptLabelW, promptLabelH);
        _promptLabel.textAlignment = NSTextAlignmentCenter;
        _promptLabel.font = [UIFont boldSystemFontOfSize:13.0];
        _promptLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        _promptLabel.text = @"将二维码/条码放入框内, 即可自动扫描";
    }
    return _promptLabel;
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
