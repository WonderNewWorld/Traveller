//
//  User.m
//  Traveller
//
//  Created by Ronaldinho on 14-3-21.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
@synthesize User_id;
@synthesize User_nickname;
@synthesize User_headphoto;
@synthesize User_activity_list;
static UserModel *userModel_one;
+(id)sharedUserModel{
    if (!userModel_one) {
        userModel_one = [[UserModel alloc]init];
        userModel_one.User_activity_list = [[NSMutableArray alloc]init];
    }
    return userModel_one;
}
@end
