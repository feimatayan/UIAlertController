//
//  ViewController.m
//  UIAlertController
//
//  Created by linghang on 2017/3/30.
//  Copyright © 2017年 wangjian. All rights reserved.
//

#import "ViewController.h"
#import "AlertControllerView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)present:(id)sender {
    
        AlertControllerView *alertOn = [[AlertControllerView alloc] initStyle:UIAlertControllerStyleAlert andTitle:@"title" andContent:@"你好" andConfirm:^(id confirmBlock) {
        NSLog(@"点击放弃");

    } andConfirmTitle:@"放弃" andCancelBlock:^(id cacel) {
        NSLog(@"点击结束");

    } andCancelTitle:@"结束" andSheetArr:nil andDestructiveIndex:0 andClickIndexBlock:^(id clickIndexBlock) {
    }];
    [self presentViewController:alertOn animated:YES completion:^{
        
    }];

}
- (IBAction)sheet:(id)sender {
    NSArray *arr = @[@"1",@"2",@"3"];
    AlertControllerView *sheet = [[AlertControllerView alloc] initStyle:UIAlertControllerStyleActionSheet andTitle:nil andContent:nil andConfirm:nil andConfirmTitle:nil andCancelBlock:^(id cacel) {
        NSLog(@"点击取消");
    } andCancelTitle:@"放弃" andSheetArr:arr andDestructiveIndex:2 andClickIndexBlock:^(id clickIndexBlock) {
        NSLog(@"点击%ld",[clickIndexBlock integerValue]);

    }];
    [self presentViewController:sheet animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
