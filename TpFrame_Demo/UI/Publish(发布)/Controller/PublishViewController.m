//
//  PublishViewController.m
//  TpFrame_Demo
//
//  Created by zhouxiaolu on 16/10/28.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "PublishViewController.h"

@interface PublishViewController ()

@end

@implementation PublishViewController
#pragma mark - life cycle method -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNavigationBar];
}
#pragma mark - private method -
- (void)setUpNavigationBar
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
}
- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
