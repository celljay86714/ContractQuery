//
//  CTScanResultModel.m
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTScanResultModel.h"

@implementation CTScanResultModel


-(void)requestScanResultSuccess:(ModelCallback)block faile:(ModelCallback)faileBlock{
    
    
    [self.parInfo setObject:self.codeString forKey:@"aplyId"];
    
    [DigApiRequestManager requestQueryStateWithInfo:self.parInfo header:nil resultCallback:^(BOOL success, NSDictionary *responseData, NSError *error) {
        
        if (success) {
            
            self.model = [CTScanResultBaseClass modelObjectWithDictionary:responseData];
            
            if (block) {
                block(self.model);
            }
        }
        else{
            
            if (faileBlock) {
                faileBlock(error);
            }
            
        }

        
    }];
    
    NSLog(@"aa");
    
}

@end
