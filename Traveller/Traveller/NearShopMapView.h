//
//  NearShopMapView.h
//  Traveller
//
//  Created by TY on 14-3-20.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>

@interface NearShopMapView : UIView <MAMapViewDelegate,AMapSearchDelegate>
@property (strong,nonatomic)MAMapView *mapView;
@property (strong,nonatomic)AMapSearchAPI *mapSearch;

@property (strong,nonatomic)UIButton *btnCurLocation;
@property (strong,nonatomic)UISegmentedControl *segMapType;
@end
