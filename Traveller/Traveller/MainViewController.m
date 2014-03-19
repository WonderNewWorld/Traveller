//
//  MainViewController.m
//  Traveller
//
//  Created by TY on 14-3-19.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [self readyhotspot];
    [self readhotpost];
    [self readyFunction];
    [self.view addSubview:self.Function_view];
    [self.view addSubview:self.hot_post_view];
    [self.view addSubview:self.hot_Spot_view];
    self.title=@"热门推荐";
    
}
-(void)readyhotspot{
    self.hot_Spot_view=[[UIView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 150)];
    self.hot_Spot_view.backgroundColor=[UIColor redColor];
}

-(void)readhotpost{
    self.hot_post_view=[[UIView alloc]initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, 150)];
    self.hot_post_view.backgroundColor=[UIColor blueColor];
}

-(void)readyFunction{
    self.Function_view=[[UIView alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 200)];
    self.Function_view.backgroundColor=[UIColor grayColor];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
