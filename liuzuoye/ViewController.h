//
//  ViewController.h
//  liuzuoye
//
//  Created by zhulei on 14-10-22.
//  Copyright (c) 2014年 zhulei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *mUserTypeSegement;
@property (weak, nonatomic) IBOutlet UITextField *mUserNameTF;
@property (weak, nonatomic) IBOutlet UITextField *mPasswordTF;
- (IBAction)pressLogin:(id)sender;

@end

