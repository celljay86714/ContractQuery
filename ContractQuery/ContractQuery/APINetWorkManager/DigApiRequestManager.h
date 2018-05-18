//
//  DigApiRequestManager.h
//  MoveVirtualCurrency
//
//  Created by zejie.wu on 2018/5/7.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DigApiRequestManager : NSObject


+ (DigApiRequestManager *)sharedManager;

- (void)registerAsNewWithInfo:(NSDictionary *)userInfo resultCallback:(NetworkRequestCallback)resultCallback;


@end
