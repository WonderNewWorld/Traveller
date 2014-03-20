//
//  DPRequest.h
//  Traveller
//
//  Created by TY on 14-3-20.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPRequest : NSObject
@property(nonatomic, strong)NSString *url;
@property(nonatomic, strong)NSDictionary *params;

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params;
@end
