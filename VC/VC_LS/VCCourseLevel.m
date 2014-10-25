//
//  VCCourseLevel.m
//  liuzuoye
//
//  Created by zhulei on 14-10-25.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import "VCCourseLevel.h"
#import "VCTheCourseWorkList.h"

@interface VCCourseLevel ()

@end

@implementation VCCourseLevel

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //从服务器获取
    //登录成功后根据教师账号类型
    self.title = _mCourseName;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStyleGrouped] ;
    
    _tableView.delegate = self ;
    _tableView.dataSource = self ;
    [self.view addSubview:_tableView] ;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _mArrayData.count ;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* strID = @"LevelCell" ;
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:strID] ;
    if (cell== nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID] ;
        cell.textLabel.textAlignment = NSTextAlignmentCenter ;
    }
    
    NSString* strName = [_mArrayData objectAtIndex:indexPath.row] ;
    
    //cell.textLabel.textAlignment = NSTextAlignmentLeft ;
    cell.textLabel.text = strName ;
    
    return cell ;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* strLevelName = [_mArrayData objectAtIndex:indexPath.row] ;
    
    NSUInteger levelID = indexPath.row ;
    
    VCTheCourseWorkList* vcWorkList = [[VCTheCourseWorkList alloc] init] ;
    
    vcWorkList.mLevelID = levelID ;
    vcWorkList.mLevelName = strLevelName ;
    
    [self.navigationController pushViewController:vcWorkList animated:YES] ;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
