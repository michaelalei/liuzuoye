//
//  VCCourseLevel.h
//  liuzuoye
//
//  Created by zhulei on 14-10-25.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCCourseLevel : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* _tableView ;
}

@property (assign,nonatomic) NSUInteger mCourseID ;
@property (assign,nonatomic) NSString*  mCourseName ;
@property (retain,nonatomic) NSArray*   mArrayData ;

@end
