//
//  CTStateListViewModel.m
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTStateListViewModel.h"

@implementation CTStateListViewModel

-(void)requestStateListSuccess:(ModelCallback)block faile:(ModelCallback)faileBack{
    
    [DigApiRequestManager requestContracStateWithInfo:self.parInfo header:nil resultCallback:^(BOOL success, NSDictionary *responseData, NSError *error) {
       
        if (success) {
            
            self.model = [CTStateListBaseClass modelObjectWithDictionary:responseData];
            
            if (block) {
                block(self.model);
            }
        }
        else{
            
            if (faileBack) {
                faileBack(error);
            }
            
        }
        
    }];
    
}

@end
