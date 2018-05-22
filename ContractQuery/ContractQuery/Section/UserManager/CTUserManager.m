//
//  CTUserManager.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/22.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTUserManager.h"

@implementation CTUserManager

static CTUserManager * userManager = nil;

+ (CTUserManager *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (userManager == nil) {
            userManager = [[self alloc] init];
        }
    });
    return userManager;
}

@end
