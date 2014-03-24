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
	
    
    //搜索栏
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    [self.view addSubview:self.searchBar];
    NSArray *types = [NSArray arrayWithObjects:@"列表",@"地图", nil];
    self.segmentType = [[UISegmentedControl alloc] initWithItems:types];
    self.segmentType.frame = CGRectMake(0, 60, 320, 30);
    [self.segmentType addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];
    self.segmentType.selectedSegmentIndex = 0;
    [self.view addSubview:self.segmentType];
    //列表视图
    self.listView=[[NearShopListView alloc] initWithFrame:CGRectMake(0, 90, 320, self.view.bounds.size.height-134)];
    [self.view addSubview:self.listView];
    //地图视图
    self.mapView=[[NearShopMapView alloc] initWithFrame:CGRectMake(0, 90, 320, self.view.bounds.size.height-134)];
    self.mapView.hidden = YES;
    [self.view addSubview:self.mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)segmentedAction:(id)sender{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            NSLog(@"list");
            self.listView.hidden = NO;
            self.mapView.hidden = YES;
            break;
        case 1:
            NSLog(@"map");
            self.listView.hidden = YES;
            self.mapView.hidden = NO;
            break;
        default:
            break;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
