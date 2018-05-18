//
//  CTScanResultModel.h
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTBaseViewModel.h"

@interface CTScanResultModel : CTBaseViewModel

@property (nonatomic, strong)CTScanResultBaseClass *model;

-(void)requestScanResultSuccess:(ModelCallback)block faile:(ModelCallback)faileBlock;

@end
