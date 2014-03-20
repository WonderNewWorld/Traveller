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

@end
