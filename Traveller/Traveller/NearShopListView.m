//
//  NearShopListView.m
//  Traveller
//
//  Created by TY on 14-3-20.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "NearShopListView.h"

@implementation NearShopListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.listView = [[UITableView alloc] initWithFrame:self.bounds];
        [self addSubview:self.listView];
        //seg商铺类型选择
        [self requestShopList];
    }
    return self;
}

- (void)requestShopList{
    NSString *strParam = @"category=美食&city=上海&latitude=31.18268013000488&longitude=121.42769622802734&sort=7&limit=20&offset_type=1&out_offset_type=1&platform=2";
    NSString *strUrl = [NSString stringWithFormat:@"%@%@?%@",DPRequestUrl,DPRequestFindShops,strParam];
    NSURL *url = [NSURL URLWithString:[DPRequest serializeURL:strUrl params:nil]];
    
    NSString *strContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
}

@end
