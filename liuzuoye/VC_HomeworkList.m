//
//  VC_HomeworkList.m
//  liuzuoye
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import "VC_HomeworkList.h"

@interface VC_HomeworkList ()

@end

@implementation VC_HomeworkList

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.title = @"李晓刚同学作业";
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    UIBarButtonItem* btnBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)] ;
    
    self.navigationItem.leftBarButtonItem = btnBack ;
    
}

-(void) pressBack
{
    [self dismissViewControllerAnimated:YES completion:nil] ;
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
