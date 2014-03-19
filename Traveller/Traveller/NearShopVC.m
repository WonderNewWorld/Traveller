//
//  NearShopVC.m
//  Traveller
//
//  Created by TY on 14-3-19.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "NearShopVC.h"

@interface NearShopVC ()

@end

@implementation NearShopVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor redColor];
    
    [MAMapServices sharedServices].apiKey =@"0576eb085c121d94c367066ea2606715";
    //搜索栏
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    [self.view addSubview:self.searchBar];
    //地图
    self.mapView=[[MAMapView alloc] initWithFrame:CGRectMake(0, 60, 320, self.view.bounds.size.height-104)];
    self.mapView.delegate = self;
    self.mapView.showTraffic = YES;
    self.mapView.showsUserLocation = YES;
    [self.view addSubview:self.mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [self.mapView endEditing:YES];
}
@end
