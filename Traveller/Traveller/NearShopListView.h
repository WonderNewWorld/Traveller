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


@interface NearShopListView : UIView

@property (strong,nonatomic)UITableView *listView;
@property (strong,nonatomic)UISegmentedControl *segShopType;
@end
