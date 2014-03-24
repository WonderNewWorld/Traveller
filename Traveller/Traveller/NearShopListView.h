//
//  NearShopListView.h
//  Traveller
//  附近商铺列表视图
//  Created by TY on 14-3-20.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import "DPRequest.h"
#import "MJRefresh.h"
#import "ShopListCell.h"


@interface NearShopListView : UIView<UITableViewDelegate,UITableViewDataSource,MJRefreshBaseViewDelegate>

@property (strong,nonatomic)UITableView *listView;
@property (strong,nonatomic)UISegmentedControl *segShopType;
@property (strong,nonatomic)NSMutableArray *arrBusiness;
@property(nonatomic,strong)MJRefreshHeaderView *header;
@property(nonatomic,strong)MJRefreshFooterView *footer;
@property(nonatomic,assign)int curPage;
@end
