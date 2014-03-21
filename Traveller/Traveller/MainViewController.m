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
    _Viewarr=[[NSMutableArray alloc] init];
    
    [super viewDidLoad];
    [self readyhotspot];
    [self readhotpost];
    [self readyFunction];
    [self readyweather];
    
    [_Viewarr addObject:self.weather_view];
    [_Viewarr addObject:self.hot_Spot_view];
    [_Viewarr addObject:self.hot_post_view];
    [_Viewarr addObject:self.Function_view];

    
    self.table=[[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height)];
    [self.table setDelegate:self];
    [self.table setDataSource:self];
    [self.view addSubview:self.table];
    self.title=@"热门推荐";
    
}
    
    
    
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_Viewarr count];
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    MaintableCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MaintableCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    [cell.contentView addSubview:[_Viewarr objectAtIndex:indexPath.section]];


    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIView *view=[_Viewarr objectAtIndex:indexPath.section];
    return view.frame.size.height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
//天气预报
-(void)readyweather{
    [self getweathInfo];
    self.weather_view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    self.weather_view.backgroundColor=[UIColor blueColor];
    UIImageView *weather_imgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.weather_view.frame.size.width, self.weather_view.frame.size.height)];
    weather_imgview.image=[UIImage imageNamed:[self.weather_model.weather stringByAppendingString:@".jpg"]];
    [self.weather_view addSubview:weather_imgview];

    [self settingWeatherInfo];
}
//热门推荐景区
-(void)readyhotspot{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"junketing" ofType:@"xml"];
    _dicCityInfo = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
 
    
    
    
    self.hot_Spot_view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    self.hot_spot_scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.hot_Spot_view.frame.size.width, self.hot_Spot_view.frame.size.height)];
    [self settingreadyhotspot];

}

-(void)settingreadyhotspot{
    NSArray *cityArr=[_dicCityInfo allKeys];
    for (int i=0; i<[cityArr count];i++ ) {
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(10+80*i, 20, 60, 80)];
        btn.backgroundColor=[UIColor yellowColor];
        [btn setBackgroundImage:[UIImage imageNamed:[[cityArr objectAtIndex:i] stringByAppendingString:@".jpg"]] forState:UIControlStateNormal];
        [self.hot_spot_scrollView addSubview:btn];
    }
    [self.hot_spot_scrollView setContentSize:CGSizeMake(20+80*[cityArr count], 0)];
    [self.hot_Spot_view addSubview:self.hot_spot_scrollView];
}
//热门经验帖
-(void)readhotpost{
    self.hot_post_view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    self.hot_post_view.backgroundColor=[UIColor blueColor];
}
//功能界面
-(void)readyFunction{
    self.Function_view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    self.Function_view.backgroundColor=[UIColor grayColor];
    
}
////收藏
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
