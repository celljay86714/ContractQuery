//
//  CTStateListCell.m
//  ContractQuery
//
//  Created by zejie.wu on 2018/5/18.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTStateListCell.h"

@implementation CTStateListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.sublabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.sublabel.font = [UIFont systemFontOfSize:19];
        self.sublabel.numberOfLines=0;
        self.sublabel.textAlignment =NSTextAlignmentCenter;
        [self.contentView addSubview:self.sublabel];
    }
    
    return self;
}


-(void)setLabelTitle:(NSString *)labelTitle
{
    self.sublabel.text = labelTitle;
    _labelTitle = labelTitle;
    
    [self needsUpdateConstraints];
    [self setNeedsUpdateConstraints];
}


-(void)updateConstraints{

    [self.sublabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(18, 0, 18, 0));
    }];

    [super updateConstraints];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
