//
//  VCTheCourseWorkList.h
//  liuzuoye
//
//  Created by zhulei on 14-10-25.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCTheCourseWorkList : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* _tableView ;
}

@property (assign,nonatomic) NSUInteger        mLevelID ;
@property (assign,nonatomic) NSString*         mLevelName ;
@property (retain,nonatomic) NSMutableArray*   mArrayData ;
@property (retain,nonatomic) UIBarButtonItem*  mBtnSendToClass ;

@property (assign,nonatomic) NSUInteger        mCurWorkCount ;

@end
