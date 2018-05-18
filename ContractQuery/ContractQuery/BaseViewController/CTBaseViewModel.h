//
//  CTBaseViewModel.h
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModels.h"

typedef void (^ModelCallback)(id responseData);

@interface CTBaseViewModel : NSObject

@property (nonatomic, strong) NSMutableDictionary *parInfo;

@end
