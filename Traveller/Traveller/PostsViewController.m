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
#import "Posts_activity_cell.h"
#import "PostsActivityModel.h"
#import "UserModel.h"
#import "DetailActivityVC.h"
@interface PostsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
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
//导航栏右键
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
    [_segment_posts_type insertSegmentWithTitle:@"活动贴" atIndex:0 animated:NO];
    [_segment_posts_type insertSegmentWithTitle:@"经验贴" atIndex:1 animated:NO];
    _segment_posts_type.selectedSegmentIndex = 0;
    [_segment_posts_type addTarget:self action:@selector(Change_to_type:) forControlEvents:UIControlEventValueChanged];
    _Posts_tableview.tableHeaderView=_segment_posts_type;
}
//加载本地帖子数据
-(void)LoadLocationDataForPosts{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"Temp_posts_activity_data" ofType:@"plist"];
    NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    self.Posts_data = [plistDict objectForKey:@"Data"];
}
//加载一个临时UserModel测试一下
-(void)initUser{
    UserModel *user = [UserModel sharedUserModel];
    PostsActivityModel *activity_1 = [[PostsActivityModel alloc]init];
    [activity_1 setPosts_id:1000];
    PostsActivityModel *activity_2 = [[PostsActivityModel alloc]init];
    [activity_2 setPosts_id:1001];
    PostsActivityModel *activity_3 = [[PostsActivityModel alloc]init];
    [activity_3 setPosts_id:1005];
    NSMutableArray *user_activity_list = [[NSMutableArray alloc]init];
    [user_activity_list addObject:activity_1];
    [user_activity_list addObject:activity_2];
    [user_activity_list addObject:activity_3];
    [user setUser_activity_list:user_activity_list];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"帖子";
    self.Posts_data = [[NSMutableArray alloc]init];
    [self init_nav_right_button];
    [self LoadLocationDataForPosts];
    [self initUser];
    [self init_Posts_tableview];
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
    return self.Posts_data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSString *ListViewCellId = @"Posts_activity_cell";
    Posts_activity_cell *cell = [_Posts_tableview dequeueReusableCellWithIdentifier:ListViewCellId];
    if (cell == nil) {
        cell = [[Posts_activity_cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListViewCellId];
    }
    PostsActivityModel *posts_model = [[PostsActivityModel alloc]init];
    NSDictionary *dic = [self.Posts_data objectAtIndex:row];
    NSNumber *num_posts_id =[dic objectForKey:@"Posts_id"];
    posts_model.Posts_id = num_posts_id.intValue;
    NSNumber *num_posts_type = [dic objectForKey:@"Posts_type"];
    posts_model.Posts_type = num_posts_type.intValue;
    posts_model.User_headphoto = [dic objectForKey:@"User_headphoto"];
    posts_model.User_nickname = [dic objectForKey:@"User_nickname"];
    posts_model.Posts_title = [dic objectForKey:@"Posts_title"];
    posts_model.Posts_content = [dic objectForKey:@"Posts_content"];
    posts_model.Posts_location = [dic objectForKey:@"Posts_location"];
    [cell setUserPhoto:posts_model.User_headphoto];
    [cell setTitle:posts_model.Posts_title];
    [cell setNickName:posts_model.User_nickname];
    [cell setLocation:posts_model.Posts_location];
    UserModel *temp_user = [UserModel sharedUserModel];
    for (PostsModel *temp_posts_model in temp_user.User_activity_list) {
        if (posts_model.Posts_id == temp_posts_model.Posts_id) {
            cell.btnForJoin.selected = YES;
            break;
        }else{
            cell.btnForJoin.selected = NO;
        }
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}
-(void)Post_posts:(UIBarButtonItem *)sender{
     SelectVc *post_activityVC = [[SelectVc alloc]init];
    [self.navigationController pushViewController:post_activityVC animated:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect cellFrameInTableView = [tableView rectForRowAtIndexPath:indexPath];
    CGRect cellFrameInSuperview = [tableView convertRect:cellFrameInTableView toView:[tableView superview]];
    DetailActivityVC *detailViewController = [[DetailActivityVC alloc]init];
    NSMutableDictionary* dict = [self.Posts_data objectAtIndex:indexPath.row];
    //
    PostsActivityModel *posts_model = [[PostsActivityModel alloc]init];
    NSNumber *num_posts_id =[dict objectForKey:@"Posts_id"];
    posts_model.Posts_id = num_posts_id.intValue;
    NSNumber *num_posts_type = [dict objectForKey:@"Posts_type"];
    posts_model.Posts_type = num_posts_type.intValue;
    posts_model.User_headphoto = [dict objectForKey:@"User_headphoto"];
    posts_model.User_nickname = [dict objectForKey:@"User_nickname"];
    posts_model.Posts_title = [dict objectForKey:@"Posts_title"];
    posts_model.Posts_content = [dict objectForKey:@"Posts_content"];
    posts_model.Posts_location = [dict objectForKey:@"Posts_location"];
    UserModel *user_model = [UserModel sharedUserModel];
    for (PostsModel *temp_post_model in user_model.User_activity_list) {
        if (posts_model.Posts_id == temp_post_model.Posts_id) {
            detailViewController.isJoin = YES;
            break;
        }else{            detailViewController.isJoin = NO;
        }
    }
    detailViewController.posts_activity_model = posts_model;
    detailViewController.yOrigin = cellFrameInSuperview.origin.y;

    [self.navigationController pushViewController:detailViewController animated:NO];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    [_Posts_tableview reloadData];
}
@end
