//
//  Config.h
//  ContractQuery
//
//  Created by linyansen on 2018/5/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define kIOS7 [[[UIDevice currentDevice] systemVersion] floatValue]>=7
#define kIOS11 [[[UIDevice currentDevice] systemVersion] floatValue]>=11
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define kRGBACOLOR(r, g, b, a)        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kTabBarHeight 49
#define kStatusBarHeight 20
#define kNavBarHeight 64
#endif /* Config_h */
