//
//  NearShopVC.h
//  Traveller
//
//  Created by TY on 14-3-19.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearShopListView.h"
#import "NearShopMapView.h"

@interface NearShopVC : UIViewController
@property (strong,nonatomic)UISearchBar *searchBar;
@property (strong,nonatomic)UISegmentedControl *segmentType;
@property (strong,nonatomic)NearShopListView *listView;
@property (strong,nonatomic)NearShopMapView *mapView;
@end
