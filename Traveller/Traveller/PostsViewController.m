//
//  PostsViewController.m
//  Traveller
//
//  Created by TY on 14-3-21.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "PostsViewController.h"
#import "Post_activity_postsVC.h"
#import "iCarousel.h"
#import "SelectVc.h"
@interface PostsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_Posts_tableview;
    UISegmentedControl *_segment_posts_type;
}
@end

@implementation PostsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)init_nav_right_button{
    UIBarButtonItem *navLeftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Post_posts:)];
    self.navigationItem.rightBarButtonItem = navLeftItem;
    
}
-(void)init_Posts_tableview{
    _Posts_tableview = [[UITableView alloc]init];
    [_Posts_tableview setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [_Posts_tableview setDelegate:self];
    [_Posts_tableview setDataSource:self];
    [self.view addSubview:_Posts_tableview];
    _segment_posts_type = [[UISegmentedControl alloc]init];
    [_segment_posts_type setFrame:CGRectMake(0, 0, 100, 30)];
    [_segment_posts_type insertSegmentWithTitle:@"经验贴" atIndex:0 animated:NO];
    [_segment_posts_type insertSegmentWithTitle:@"活动贴" atIndex:1 animated:NO];
    _segment_posts_type.selectedSegmentIndex = 0;
    [_segment_posts_type addTarget:self action:@selector(Change_to_type:) forControlEvents:UIControlEventValueChanged];
    _Posts_tableview.tableHeaderView=_segment_posts_type;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"帖子";
    [self init_Posts_tableview];
    [self init_nav_right_button];
}
-(void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Segement值改变
-(void)Change_to_type:(UISegmentedControl *)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:
            break;
        case 1:
            break;
            
            
        default:
            break;
    }
}
#pragma mark - tableview数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{    NSString *ListViewCellId = @"cell";
    UITableViewCell *cell = [_Posts_tableview dequeueReusableCellWithIdentifier:ListViewCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListViewCellId];
    }
    return cell;
}
-(void)Post_posts:(UIBarButtonItem *)sender{
     SelectVc *post_activityVC = [[SelectVc alloc]init];
    [self.navigationController pushViewController:post_activityVC animated:YES];
}

@end
