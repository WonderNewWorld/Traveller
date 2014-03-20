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
        //附近商户列表
        self.listView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.bounds.size.width, self.bounds.size.height-30)];
        self.listView.delegate = self;
        self.listView.dataSource = self;
        [self addSubview:self.listView];
        //seg商铺类型选择
        NSArray *types = @[@"距离",@"类型",@"排序"];
        self.segShopType = [[UISegmentedControl alloc] initWithItems:types];
        self.segShopType.tintColor = [UIColor purpleColor];
        self.segShopType.frame = CGRectMake(0, 0, self.bounds.size.width, 30);
        [self addSubview:self.segShopType];
        
        self.arrBusiness = [[NSMutableArray alloc] init];
        [self.arrBusiness addObjectsFromArray:[DPRequest getBusinessListByCity:@"重庆" andCategory:@"美食" andRadius:1000 andSort:7 andPage:1]];
        
    }
    return self;
}

#pragma mark -UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrBusiness count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    // 设置数据
    BusinessModel *temp = self.arrBusiness[indexPath.row];
    cell.textLabel.text = temp.name;
    cell.detailTextLabel.text = temp.address;
    
    return cell;
}


#pragma mark -UITableViewDelegate Methods

@end
