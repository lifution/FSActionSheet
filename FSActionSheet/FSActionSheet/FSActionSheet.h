//
//  FSActionSheet.h
//  FSatherUp
//
//  Created by Steven on 16/5/10.
//  Copyright © 2016年 GatherUp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSActionSheetItem.h"
#import "FSActionSheetConfig.h"

@interface FSActionSheet : UIView

@property (nonatomic, assign) FSContentAlignment contentAlignment; ///< 默认是FSContentAlignmentCenter.

@property (nonatomic, assign) BOOL hideOnTouchOutside; ///< 是否开启点击半透明层隐藏弹窗, 默认为YES.

- (instancetype)initWithTitle:(NSString *)title cancelTitle:(NSString *)cancelTitle items:(NSArray<FSActionSheetItem *> *)items;

- (void)showWithSelectedCompletion:(FSActionSheetHandler)selectedHandler;

@end
