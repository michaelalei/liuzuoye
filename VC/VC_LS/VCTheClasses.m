//
//  VCTheClasses.m
//  liuzuoye
//
//  Created by zhulei on 14-10-25.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import "VCTheClasses.h"
#import <BmobSDK/Bmob.h>

@interface VCTheClasses ()

@end

@implementation VCTheClasses

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = _mLevelName;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStyleGrouped] ;
    
    _tableView.delegate = self ;
    _tableView.dataSource = self ;
    [self.view addSubview:_tableView] ;
    
    _mBtnSendToParent = [[UIBarButtonItem alloc] initWithTitle:@"发送给家长" style:UIBarButtonItemStylePlain target:self action:@selector(pressSendTo)] ;
    
    _mBtnSendToParent.enabled = NO ;
    
    UIBarButtonItem* btnBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)] ;
    
    self.navigationItem.leftBarButtonItem = btnBack ;
    
    self.navigationItem.rightBarButtonItem = _mBtnSendToParent ;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"SchoolClass" ofType:@"plist"] ;
    
    
    NSArray* arrayAll = [[NSMutableArray alloc] initWithContentsOfFile:path] ;
    
    NSLog(@"arrayAll = %@",arrayAll) ;
    
    //小学
    NSDictionary* dicPrimarySC = [arrayAll objectAtIndex:0] ;
    
    NSArray* arraySchool = [dicPrimarySC objectForKey:@"Schools"] ;
    
    NSUInteger schoolIndex = 0 ;
    
    NSDictionary* dicTheSchool = [arraySchool objectAtIndex:schoolIndex] ;
    
    NSArray* arrayAllClass = [dicTheSchool objectForKey:@"New item"] ;
    
    _mArrayData = [arrayAllClass objectAtIndex:_mLevelID] ;
    
    _mArrayChoose = [[NSMutableArray alloc] init] ;
    
    for (int i = 0 ; i < _mArrayData.count; i++)
    {
        NSNumber* num = [NSNumber numberWithBool:NO] ;
        
        [_mArrayChoose addObject:num] ;
    }
    
}

-(void) pressBack
{
    [self dismissViewControllerAnimated:YES completion:nil] ;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _mArrayData.count ;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1 ;
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
    
    NSString* className = [_mArrayData objectAtIndex:indexPath.section] ;
    
    NSNumber* num = [_mArrayChoose objectAtIndex:indexPath.section] ;
    
    BOOL value = [num boolValue] ;
    
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
    cell.textLabel.text = className ;
    
    return cell ;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath] ;
  
    NSNumber* numBool = [_mArrayChoose objectAtIndex:indexPath.section] ;
    
    BOOL value = [numBool boolValue] ;
    
    numBool = [NSNumber numberWithBool:!value] ;
    
    [_mArrayChoose replaceObjectAtIndex:indexPath.row withObject:numBool] ;
    
    if( cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone ;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        _mCurClassCount-- ;
    }
    else
    {
        cell.textLabel.textAlignment = NSTextAlignmentLeft ;
        cell.accessoryType = UITableViewCellAccessoryCheckmark ;
        _mCurClassCount ++ ;
    }
    
    if (_mCurClassCount > 0) {
        _mBtnSendToParent.enabled = YES ;
    }
    else
    {
        _mBtnSendToParent.enabled = NO ;
    }
}


-(void) pressSendTo
{
    BmobPush* push = [BmobPush push] ;
    
    //[push setChannel:@"1000"] ;
    
    [push setMessage:@"留作业啦"] ;
    
    //BmobQuery *query = [BmobInstallation query];
    //条件为isDeveloper是true
    //[query whereKey:@"isDeveloper" equalTo:[NSNumber numberWithBool:YES] ];
    //[push setQuery:query];
    
    [push sendPushInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
        NSLog(@"push error =====>%@",[error description]);
    }];
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
