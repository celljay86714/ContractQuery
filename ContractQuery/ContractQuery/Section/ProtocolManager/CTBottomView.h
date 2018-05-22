//
//  CTBottomView.h
//  ContractQuery
//
//  Created by linyansen on 2018/5/21.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BottomViewClickBlock) (void);
@interface CTBottomView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *stateBtn;
@property (nonatomic, copy) BottomViewClickBlock bottomViewClickBlock;
@end
