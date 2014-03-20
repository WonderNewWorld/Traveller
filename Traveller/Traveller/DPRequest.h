//
//  DPRequest.h
//  Traveller
//
//  Created by TY on 14-3-20.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"
#import "BusinessModel.h"

@interface DPRequest : NSObject
@property(nonatomic, strong)NSString *url;
@property(nonatomic, strong)NSDictionary *params;

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params;
+ (NSArray *)getBusinessListByCity:(NSString *)city andCategory:(NSString *)category andRadius:(int)radius andSort:(int)sort andPage:(int)page;
@end
