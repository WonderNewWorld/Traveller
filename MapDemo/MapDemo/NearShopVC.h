//
//  NearShopVC.h
//  Traveller
//
//  Created by TY on 14-3-19.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>

@interface NearShopVC : UIViewController <MAMapViewDelegate>

@property (strong,nonatomic)UISearchBar *searchBar;
@property (strong,nonatomic)MAMapView *mapView;
@end
