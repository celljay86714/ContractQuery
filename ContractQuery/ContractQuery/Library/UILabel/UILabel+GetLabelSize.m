//
//  UILabel+GetLabelSize.m
//  信用微钱包
//
//  Created by linyansen on 2018/2/6.
//  Copyright © 2018年 wjl. All rights reserved.
//

#import "UILabel+GetLabelSize.h"

@implementation UILabel (GetLabelSize)

- (CGFloat)getLabelHeight
{
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    return size.height;
}

- (CGFloat)getLabelWidth
{
    CGSize size = [self sizeThatFits:CGSizeMake(MAXFLOAT, self.frame.size.height)];
    return size.width;
}
@end
