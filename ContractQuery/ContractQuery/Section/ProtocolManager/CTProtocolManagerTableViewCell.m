//
//  CTProtocolManagerTableViewCell.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTProtocolManagerTableViewCell.h"

@implementation CTProtocolManagerTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.leftImageView=[[UIImageView alloc] init];

        [self.contentView addSubview:self.leftImageView];
        
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).mas_offset(15);
            make.width.height.mas_equalTo(70);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        self.titleLabel = [UILabel new];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(20);
            make.width.mas_equalTo(150);
            make.top.bottom.mas_equalTo(self.contentView);
        }];
        
        UIImage *image = [UIImage imageNamed:@"arrow_right"];
        self.rightImageView = [[UIImageView alloc] initWithImage:image];
        [self.contentView addSubview:self.rightImageView];
        [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView).mas_offset(-20);
            make.width.mas_equalTo(image.size.width);
            make.height.mas_equalTo(image.size.height);
            make.centerY.mas_equalTo(self.contentView);
        }];
    }
    return self;
}


- (void)updateCellWithDictionary:(NSDictionary *)dic
{
    self.titleLabel.text = dic[@"title"];
    UIImage *image = [UIImage imageNamed:dic[@"imageName"]];
    self.leftImageView.image = image;
}
@end
