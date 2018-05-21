//
//  CTProtocolManagerTableViewCell.h
//  ContractQuery
//
//  Created by linyansen on 2018/5/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTProtocolManagerTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *rightImageView;

- (void)updateCellWithDictionary:(NSDictionary *)dic;
@end
