//
//  VCCourseType.h
//  liuzuoye
//
//  Created by zhulei on 14-10-25.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCCourseType : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* _tableView ;
}

@property (retain,nonatomic) NSMutableArray* arrayData ;

@end
