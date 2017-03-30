//
//  AlertControllerView.h
//  UIAlertController
//
//  Created by linghang on 2017/3/30.
//  Copyright © 2017年 wangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CancelBlcok)(id cacel);
typedef void(^ConfirmBlock)(id confirmBlock);
typedef void(^ClickIndexBlock)(id clickIndexBlock);

@protocol AlertBlock <NSObject>

@optional

@end

@interface AlertControllerView : UIAlertController<AlertBlock>
@property (nonatomic, copy) CancelBlcok cancelBlock;
@property (nonatomic, copy) ConfirmBlock confirmBlock;
@property (nonatomic,copy) ClickIndexBlock clickIndexBlock;
- (id)initStyle:(UIAlertControllerStyle)actionStyle andTitle:(NSString *)title andContent:(NSString *)content andConfirm:(ConfirmBlock)confirmBLock andConfirmTitle:(NSString *)confirmTitle andCancelBlock:(CancelBlcok)cancelBlock andCancelTitle:(NSString *)cancelTitle andSheetArr:(NSArray *)sheetArr andDestructiveIndex:(NSInteger)index andClickIndexBlock:(ClickIndexBlock)clickIndexBlock;
@end
