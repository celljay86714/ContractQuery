//
//  CTBaseViewModel.m
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTBaseViewModel.h"

@implementation CTBaseViewModel

-(id)init{
    
    if (self = [super init]) {
        
        self.parInfo = [NSMutableDictionary  new];
        
        if ([CurrentAPIHost isEqualToString:PRODUCT_HOST]) {
            
            [self.parInfo setObject:@"3*Rgr&574&Qr5HBq3Gp$m2exy!63X!$" forKey:@"accessKey"];

        }
        else
            [self.parInfo setObject:@"Rgr&574@65HBq3Gp$m2exytWQ263X!$" forKey:@"accessKey"];
    }
    
    
    return self;
    
}

@end
