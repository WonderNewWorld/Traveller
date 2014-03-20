//
//  BusinessModel.m
//  Traveller
//
//  Created by TY on 14-3-20.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "BusinessModel.h"

@implementation BusinessModel
+ (BusinessModel *)setDetailWithDic:(NSDictionary *)dic{
    BusinessModel *business = [[BusinessModel alloc] init];
    business.business_id = [[dic objectForKey:@"business_id"] intValue];
    business.name = [dic objectForKey:@"name"];
    business.branch_name = [dic objectForKey:@"branch_name"];
    business.address = [dic objectForKey:@"address"];
    business.telephone = [dic objectForKey:@"telephone"];
    business.city = [dic objectForKey:@"city"];
    business.regions = [dic objectForKey:@"regions"];
    business.categories = [dic objectForKey:@"categories"];
    business.latitude = [[dic objectForKey:@"latitude"] floatValue];
    business.longitude = [[dic objectForKey:@"longitude"] floatValue];
    business.avg_rating = [[dic objectForKey:@"avg_rating"] floatValue];
    business.rating_img_url = [dic objectForKey:@"rating_img_url"];
    business.rating_s_img_url = [dic objectForKey:@"rating_s_img_url"];
    business.product_grade = [[dic objectForKey:@"product_grade"] intValue];
    business.decoration_grade = [[dic objectForKey:@"decoration_grade"] intValue];
    business.service_grade = [[dic objectForKey:@"service_grade"] intValue];
    business.product_score = [[dic objectForKey:@"product_score"] floatValue];
    business.decoration_score = [[dic objectForKey:@"decoration_score"] floatValue];
    business.service_score = [[dic objectForKey:@"service_score"] floatValue];
    business.avg_price = [[dic objectForKey:@"avg_price"] intValue];
    business.review_count = [[dic objectForKey:@"review_count"] intValue];
    business.distance = [[dic objectForKey:@"distance"] intValue];
    business.business_url = [dic objectForKey:@"business_url"];
    business.photo_url = [dic objectForKey:@"photo_url"];
    business.s_photo_url = [dic objectForKey:@"s_photo_url"];
    business.has_coupon = [[dic objectForKey:@"has_coupon"] intValue];
    business.coupon_id = [[dic objectForKey:@"coupon_id"] intValue];
    business.coupon_description = [dic objectForKey:@"coupon_description"];
    business.coupon_url = [dic objectForKey:@"coupon_url"];
    business.has_deal = [[dic objectForKey:@"has_deal"] intValue];
    business.deal_count = [[dic objectForKey:@"deal_count"] intValue];
    business.deals = [dic objectForKey:@"deals"];
    business.has_online_reservation = [[dic objectForKey:@"has_online_reservation"] intValue];
    business.online_reservation_url = [dic objectForKey:@"online_reservation_url"];
    return business;
}
@end
