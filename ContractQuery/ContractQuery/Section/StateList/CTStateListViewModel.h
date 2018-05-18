//
//  CTStateListViewModel.h
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTBaseViewModel.h"

@interface CTStateListViewModel : CTBaseViewModel

@property (nonatomic, strong)CTStateListBaseClass *model;

-(void)requestStateListSuccess:(ModelCallback)block faile:(ModelCallback)faileBack;

@end
