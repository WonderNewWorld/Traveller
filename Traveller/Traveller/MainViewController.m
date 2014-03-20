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
    self.weather_model=[[weatherModel alloc] init];
    
    [super viewDidLoad];
    [self readyhotspot];
    [self readhotpost];
    [self readyFunction];
    [self readyweather];
    [self.view addSubview:self.weather_view];
    [self.view addSubview:self.Function_view];
    [self.view addSubview:self.hot_post_view];
    [self.view addSubview:self.hot_Spot_view];
    self.title=@"热门推荐";
    
}
//天气预报
-(void)readyweather{
    [self getweathInfo];
    self.weather_view=[[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 100)];
    self.weather_view.backgroundColor=[UIColor blueColor];
    UIImageView *weather_imgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.weather_view.frame.size.width, self.weather_view.frame.size.height)];
    weather_imgview.image=[UIImage imageNamed:[self.weather_model.weather stringByAppendingString:@".jpg"]];
    [self.weather_view addSubview:weather_imgview];

    [self settingWeatherInfo];
}
//热门推荐景区
-(void)readyhotspot{
    self.hot_Spot_view=[[UIView alloc] initWithFrame:CGRectMake(0, 170, self.view.frame.size.width, 120)];
    self.hot_Spot_view.backgroundColor=[UIColor redColor];
}
//热门经验帖
-(void)readhotpost{
    self.hot_post_view=[[UIView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 120)];
    self.hot_post_view.backgroundColor=[UIColor blueColor];
}
//功能界面
-(void)readyFunction{
    self.Function_view=[[UIView alloc]initWithFrame:CGRectMake(0, 430, self.view.frame.size.width, 70)];
    self.Function_view.backgroundColor=[UIColor grayColor];
    
}
//获得天气信息
-(void)getweathInfo{
    NSString *city=[NSString stringWithFormat:@"%d",[weatherjson cityChangCityID:@"重庆"] ];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://m.weather.com.cn/data/%@.html",city]];
        NSError *error=nil;
    NSString *strContents=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    self.weather_model=[weatherjson newWeatherWithString:strContents];
    NSLog(@"%@",self.weather_model.city);
}
//设置天气info
-(void)settingWeatherInfo{
    UILabel *citylbl=[[UILabel alloc] initWithFrame:CGRectMake(270, 20, 30, 20)];
    citylbl.text=self.weather_model.city;
    NSLog(@"%@",citylbl.text);
    citylbl.adjustsFontSizeToFitWidth=YES;
    
    UILabel *templbl=[[UILabel alloc] initWithFrame:CGRectMake(270,45,40,20)];
    templbl.text=self.weather_model.temp;
    templbl.adjustsFontSizeToFitWidth=YES;
    
    UILabel *weatherlbl=[[UILabel alloc] initWithFrame:CGRectMake(270, 70, 30, 20)];
    weatherlbl.text=self.weather_model.weather;
    weatherlbl.adjustsFontSizeToFitWidth=YES;
    [self.weather_view addSubview:weatherlbl];
    [self.weather_view addSubview:templbl];
    [self.weather_view addSubview:citylbl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
