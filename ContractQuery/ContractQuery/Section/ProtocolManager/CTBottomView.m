//
//  CTBottomView.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/21.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTBottomView.h"

@implementation CTBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.titleLabel = [UILabel new];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.text = @"协议状态：";
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(80);
            make.top.bottom.mas_equalTo(self);
            make.width.mas_equalTo(90);
        }];
        
        self.stateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.stateBtn setTitle:@"未选择" forState:UIControlStateNormal];
        [self.stateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.stateBtn setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
        [self.stateBtn addTarget:self action:@selector(stateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.stateBtn];
        [self.stateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_right);
            make.top.bottom.mas_equalTo(self);
            make.width.mas_equalTo(70);
        }];
        
        UIImage *image = [UIImage imageNamed:@"arrow_down"];
        UIImageView *rightImageView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:rightImageView];
        [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.stateBtn.mas_right);
            make.centerY.mas_equalTo(self);
            make.width.mas_equalTo(image.size.width);
            make.height.mas_equalTo(image.size.height);
        }];
    }
    return self;
}


- (void)stateBtnClick:(UIButton *)sender
{
    
}

@end
