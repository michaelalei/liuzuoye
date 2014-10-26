//
//  ViewController.m
//  liuzuoye
//
//  Created by zhulei on 14-10-22.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import "ViewController.h"
#import <BmobSDK/Bmob.h>
#import "VCCourseType.h"
#import "VC_HomeworkList.h"
@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _mPasswordTF.delegate = self ;
    _mUserNameTF.delegate = self ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressLogin:(id)sender
{
    if (_mUserTypeSegement.selectedSegmentIndex == 0)
    {
        VCCourseType* vc = [[VCCourseType alloc] init] ;
        
        UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc] ;
        
        nav.navigationBar.translucent = NO ;
        
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal ;
        
        [self presentViewController:nav animated:YES completion:nil] ;
    }
    if (_mUserTypeSegement.selectedSegmentIndex == 1)
    {
        VC_HomeworkList* vc = [[VC_HomeworkList alloc] init] ;
        
        UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc] ;
        
        nav.navigationBar.translucent = NO ;
        
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal ;
        
        [self presentViewController:nav animated:YES completion:nil] ;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_mUserNameTF resignFirstResponder] ;
    [_mPasswordTF resignFirstResponder] ;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [_mUserNameTF resignFirstResponder] ;
    [_mPasswordTF resignFirstResponder] ;
    return YES ;
}


-(void) testBmob
{
    //    BmobObject *gameScore = [BmobObject objectWithClassName:@"GameScore"];
    //    [gameScore setObject:@"小明" forKey:@"playerName"];
    //    [gameScore setObject:@78 forKey:@"score"];
    //    [gameScore setObject:[NSNumber numberWithBool:YES] forKey:@"cheatMode"];
    //    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error)
    //     {
    //
    //    }];
    
    //    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"GameScore"];
    //    //查找GameScore表所有数据
    //    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
    //        for (BmobObject *obj in array) {
    //            //打印playerName
    //            NSLog(@"obj.playerName = %@", [obj objectForKey:@"playerName"]);
    //        }
    //    }];
}

@end
