//
//  AlertControllerView.m
//  UIAlertController
//
//  Created by linghang on 2017/3/30.
//  Copyright © 2017年 wangjian. All rights reserved.
//

#import "AlertControllerView.h"

@interface AlertControllerView ()

@end

@implementation AlertControllerView
- (id)initStyle:(UIAlertControllerStyle)actionStyle andTitle:(NSString *)title andContent:(NSString *)content andConfirm:(ConfirmBlock)confirmBLock andConfirmTitle:(NSString *)confirmTitle andCancelBlock:(CancelBlcok)cancelBlock andCancelTitle:(NSString *)cancelTitle andSheetArr:(NSArray *)sheetArr andDestructiveIndex:(NSInteger)index andClickIndexBlock:(ClickIndexBlock)clickIndexBlock{
    self.confirmBlock = confirmBLock;
    self.cancelBlock = cancelBlock;

    if (title.length == 0) {
        title = nil;
    }
    if (content.length == 0) {
        content = nil;
    }
    if ([cancelTitle length] == 0) {
        cancelTitle = @"取消";
    }
    if ([confirmTitle length] == 0) {
        confirmTitle = @"确定";
    }
    self  = [AlertControllerView alertControllerWithTitle:title message:content preferredStyle:actionStyle];
    typeof(self) weakSelf = self;
    if (actionStyle == UIAlertControllerStyleAlert) {//弹出
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (weakSelf.confirmBlock) {
                weakSelf.confirmBlock(@"ok");
            }
        }];
        [self addAction:confirmAction];

    }else{//从底部弹出
        self.clickIndexBlock = clickIndexBlock;
        [sheetArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //数组arr里边默认是字符串
            UIAlertAction *tempAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (self.clickIndexBlock) {
                    self.clickIndexBlock(@(idx));
                }
            }];
            if (idx == index) {//不想传这个值，直接数组的count即可
                tempAction =  [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    if (self.clickIndexBlock) {
                        self.clickIndexBlock(@(idx));
                    }
                }];

            }
            [self addAction:tempAction];
        }];
        
        
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (weakSelf.cancelBlock) {
            weakSelf.cancelBlock(@"cancell");
        }
    }];
    [self addAction:cancelAction];

    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
