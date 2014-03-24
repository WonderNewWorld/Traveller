//
//  NearShopMapView.m
//  Traveller
//
//  Created by TY on 14-3-20.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "NearShopMapView.h"

@implementation NearShopMapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        //地图视图
        self.mapView=[[MAMapView alloc] initWithFrame:self.bounds];
        self.mapView.delegate = self;
        self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = 1;
        [self addSubview:self.mapView];
        MAUserLocation *userLoc = self.mapView.userLocation;
        
        //search
        self.mapSearch.delegate = self;
        
        //btn 当前位置
        self.btnCurLocation = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width-40, self.bounds.size.height-60, 30, 30)];
        self.btnCurLocation.backgroundColor = [UIColor redColor];
        [self.btnCurLocation setTitle:@"CL" forState:UIControlStateNormal];
        [self.btnCurLocation addTarget:self action:@selector(btnCurLocationAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnCurLocation];
        
    }
    return self;
}

- (void)btnCurLocationAction{
    NSLog(@"to cur location!");
    self.mapView.userTrackingMode = 1;
}

- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
    
    regeo.location = [AMapGeoPoint locationWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    regeo.requireExtension = YES;
    
    [self.mapSearch AMapReGoecodeSearch:regeo];
}
#pragma mark - MAMapViewDelegate methods
- (void)mapViewWillStartLocatingUser:(MAMapView *)mapView{
    NSLog(@"start locating user");
}

/*!
 @brief 在地图View停止定位后，会调用此函数*/
- (void)mapViewDidStopLocatingUser:(MAMapView *)mapView{
    NSLog(@"stop locating user");
}


/*!
 @brief 位置或者设备方向更新后，会调用此函数*/
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    NSLog(@"update locating user");
    CLLocationCoordinate2D coordinate = [userLocation coordinate];
    NSLog(@"user location:\nlongitude:%f latitude:%f",coordinate.longitude,coordinate.latitude);
}

/*
 @brief 定位失败后，会调用此函数*/
- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error{
    NSLog(@"locate user erroer:%@",error);
}

#pragma mark - AMapSearchDelegate methods

/* 逆地理编码回调. */
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode != nil)
    {
        NSLog(@"%@",response.regeocode.formattedAddress);
    }
}
@end
