//
//  VCCourseType.m
//  liuzuoye
//
//  Created by zhulei on 14-10-25.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import "VCCourseType.h"
#import "VCCourseLevel.h"

@interface VCCourseType ()

@end

@implementation VCCourseType

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //从服务器获取
    //登录成功后根据教师账号类型
    self.title = @"长宁一小";
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"CourseList" ofType:@"plist"] ;
    
    _arrayData = [[NSMutableArray alloc] initWithContentsOfFile:path] ;
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStyleGrouped] ;
    
    _tableView.delegate = self ;
    _tableView.dataSource = self ;
    [self.view addSubview:_tableView] ;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayData.count ;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* strID = @"CategoryCell" ;
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:strID] ;
    if (cell== nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID] ;
        cell.textLabel.textAlignment = NSTextAlignmentCenter ;
    }
    
    NSDictionary* dic = [_arrayData objectAtIndex:indexPath.section] ;
    NSString* strName = [dic objectForKey:@"CourseName"] ;
    
    cell.textLabel.text = strName ;
    
    return cell ;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* dic = [_arrayData objectAtIndex:indexPath.section] ;

    NSUInteger courseID = indexPath.section ;
    
    NSString* courseName = [dic objectForKey:@"CourseName"] ;
    
    NSArray* arrayLevel = [dic objectForKey:@"LevelList"] ;
    
    VCCourseLevel* vcLevel = [[VCCourseLevel alloc] init] ;
    
    vcLevel.mCourseID = courseID ;
    vcLevel.mCourseName = courseName ;
    vcLevel.mArrayData = arrayLevel ;
    
    [self.navigationController pushViewController:vcLevel animated:YES] ;
    
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
