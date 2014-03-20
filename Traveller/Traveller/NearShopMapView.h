//
//  NearShopMapView.h
//  Traveller
//
//  Created by TY on 14-3-20.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapView.h>
@interface NearShopMapView : UIView <MAMapViewDelegate>
@property (strong,nonatomic)MAMapView *mapView;
@property (strong,nonatomic)UIButton *btnCurLocation;
@end
