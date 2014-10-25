//
//  VCTheClasses.h
//  liuzuoye
//
//  Created by zhulei on 14-10-25.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCTheClasses : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* _tableView ;
}

@property (assign,nonatomic) NSUInteger        mLevelID ;
@property (assign,nonatomic) NSString*         mLevelName ;
@property (retain,nonatomic) NSMutableArray*   mArrayData ;
@property (retain,nonatomic) UIBarButtonItem*  mBtnSendToParent ;

@property (assign,nonatomic) NSUInteger        mCurClassCount ;
@property (retain,nonatomic) NSMutableArray*   mArrayChoose ;


@end
