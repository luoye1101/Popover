//
//  ViewController.m
//  Popover
//
//  Created by 黄跃奇 on 16/10/28.
//  Copyright © 2016年 yueqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    button.center = self.view.center;
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(popover:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 点击事件
- (void)popover:(UIButton *)button {
    
    UIViewController *viewController = [UIViewController new];
    
    viewController.view.backgroundColor = [UIColor yellowColor];
    
    // 1. 设置展现类型为popover
    viewController.modalPresentationStyle = UIModalPresentationPopover;
    viewController.preferredContentSize = CGSizeMake(0, 120);
    
    // 2. 设置展现的代理
    viewController.popoverPresentationController.delegate = self;
    
    // 3. 指定弹窗的定位控件
    viewController.popoverPresentationController.sourceView = button;
    
    // 4. 设置箭头方向
    viewController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    
    // 5. 设置箭头位置
    CGSize size = button.bounds.size;
    viewController.popoverPresentationController.sourceRect = CGRectMake(size.width * 0.5, size.height, 0, 0);
    
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma mark - UIAdaptivePresentationControllerDelegate
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end
