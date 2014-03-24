//
//  ShopListCell.m
//  Traveller
//
//  Created by TY on 14-3-24.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "ShopListCell.h"

@implementation ShopListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setCellWithBusinessModel:(BusinessModel *)model{
    self.lbName.text = model.name;
    self.lbAvg_price.text = [NSString stringWithFormat:@"人均：%d元",model.avg_price];
    self.lbAddress.text = model.address;
    self.lbDistence.text = [NSString stringWithFormat:@"距离：%dm",model.distance];
    
}
@end
