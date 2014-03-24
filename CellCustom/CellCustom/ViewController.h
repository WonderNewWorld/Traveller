//
//  ViewController.h
//  CellCustom
//
//  Created by TY on 14-3-24.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCell.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *table;
@property(strong,nonatomic)NSArray *arr;
@end
