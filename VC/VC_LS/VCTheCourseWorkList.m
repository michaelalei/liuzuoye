//
//  VCTheCourseWorkList.m
//  liuzuoye
//
//  Created by zhulei on 14-10-25.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import "VCTheCourseWorkList.h"
#import "VCTheClasses.h"

@interface VCTheCourseWorkList ()

@end

@implementation VCTheCourseWorkList

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //从服务器获取
    //登录成功后根据教师账号类型
    self.title = _mLevelName;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStyleGrouped] ;
    
    _tableView.delegate = self ;
    _tableView.dataSource = self ;
    [self.view addSubview:_tableView] ;
    
    _mBtnSendToClass = [[UIBarButtonItem alloc] initWithTitle:@"留给班级" style:UIBarButtonItemStylePlain target:self action:@selector(pressSendTo)] ;
    
    _mBtnSendToClass.enabled = NO ;
    
    self.navigationItem.rightBarButtonItem = _mBtnSendToClass ;
    
    _mArrayData = [[NSMutableArray alloc] init] ;
    
    for (int i = 0 ; i < 28; i++)
    {
        NSMutableDictionary* dic = [[NSMutableDictionary alloc] init] ;
        
        NSString* unitName = [NSString stringWithFormat:@"第%d课",i+1] ;
        
        [dic setObject:unitName forKey:@"unitName"] ;
        
        NSMutableArray* arrayWork = [[NSMutableArray alloc] init] ;
        
        for (int j =0 ; j < 10; j++) {
            NSString* strHomeName = [NSString stringWithFormat:@"练习题目%d",j+1] ;
            
            [arrayWork addObject:strHomeName] ;
        }
        
        NSMutableArray* arrayCheck = [[NSMutableArray alloc] init] ;
        
        for (int j =0 ; j < 10; j++) {
            
            NSNumber* numBOOL = [NSNumber numberWithBool:NO] ;
            
            [arrayCheck addObject:numBOOL] ;
        }
        
        [dic setObject:arrayCheck forKey:@"checkList"] ;
        
        [dic setObject:arrayWork forKey:@"workList"] ;
        [_mArrayData addObject:dic] ;
    }
}

-(void) pressSendTo
{
    VCTheClasses* vcClasses = [[VCTheClasses alloc] init] ;
    
    vcClasses.mLevelID = _mLevelID/2;
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vcClasses] ;
    
    nav.navigationBar.translucent = NO ;
    
    [self presentViewController:nav animated:YES completion:nil] ;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _mArrayData.count ;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary* dic = [_mArrayData objectAtIndex:section] ;
    
    NSArray* arrayWork = [dic objectForKey:@"workList"] ;
    
    return arrayWork.count ;
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
    
    NSDictionary* dic = [_mArrayData objectAtIndex:indexPath.section] ;
    
    NSArray* arrayWork = [dic objectForKey:@"workList"] ;
    
    NSString* strName = [arrayWork objectAtIndex:indexPath.row] ;
    
    NSArray* arrayCheck = [dic objectForKey:@"checkList"] ;
    
    NSNumber* numBool = [arrayCheck objectAtIndex:indexPath.row] ;
    
    BOOL value = [numBool boolValue] ;
    
    NSLog(@"value = %d",value) ;
    if (value == YES)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark ;
        cell.textLabel.textAlignment = NSTextAlignmentLeft ;

    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone ;
        cell.textLabel.textAlignment = NSTextAlignmentCenter ;
    }
    //cell.textLabel.textAlignment = NSTextAlignmentLeft ;
    cell.textLabel.text = strName ;
    
    return cell ;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary* dic = [_mArrayData objectAtIndex:section] ;

    NSString* unitName = [dic objectForKey:@"unitName"] ;
    
    return unitName ;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath] ;
    
    NSDictionary* dic = [_mArrayData objectAtIndex:indexPath.section] ;
    
    NSMutableArray* arrayCheck = [dic objectForKey:@"checkList"] ;

    NSNumber* numBool = [arrayCheck objectAtIndex:indexPath.row] ;
    
    BOOL value = [numBool boolValue] ;
    
    numBool = [NSNumber numberWithBool:!value] ;
    
    [arrayCheck replaceObjectAtIndex:indexPath.row withObject:numBool] ;
    
    if( cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone ;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        _mCurWorkCount-- ;
    }
    else
    {
        cell.textLabel.textAlignment = NSTextAlignmentLeft ;
        cell.accessoryType = UITableViewCellAccessoryCheckmark ;
        _mCurWorkCount ++ ;
    }
    
    if (_mCurWorkCount > 0) {
        _mBtnSendToClass.enabled = YES ;
    }
    else
    {
        _mBtnSendToClass.enabled = NO ;
    }
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
