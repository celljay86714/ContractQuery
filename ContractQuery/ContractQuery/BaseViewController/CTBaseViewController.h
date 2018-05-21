//
//  CTBaseViewController.h
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LeftItemClickBlock) (UIBarButtonItem *leftItem);
typedef void (^RightItemClickBlock) (UIBarButtonItem *rightItem);
@interface CTBaseViewController : UIViewController

@property (nonatomic, strong) UILabel *navTitleView;
@property (nonatomic, copy) LeftItemClickBlock leftItemClickBlock;
@property (nonatomic, copy) RightItemClickBlock rightItemClickBlock;


//设置navigationbar的title
- (void)setNavTitle:(NSString *)title;

//设置navigationbar的title
- (void)setNavTitle:(NSString *)title titleColor:(UIColor *)color;


//设置navigationbar的leftitem
- (void)setNavLeftItemWithTitle:(NSString *)title imageStr:(NSString *)imageStr leftItemClickBlock:(LeftItemClickBlock)leftItemClickBlock;
//设置navigationbar的rightitem
- (void)setNavRightItemWithTitle:(NSString *)title imageStr:(NSString *)imageStr rightItemClickBlock:(RightItemClickBlock)rightItemClickBlock;

@end
