//
//  FSActionSheetCell.h
//  FSatherUp
//
//  Created by Steven on 16/5/11.
//  Copyright © 2016年 GatherUp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSActionSheetConfig.h"
@class FSActionSheetItem;

@interface FSActionSheetCell : UITableViewCell

@property (nonatomic, assign) FSContentAlignment contentAlignment;
@property (nonatomic, strong) FSActionSheetItem *item;
@property (nonatomic, assign) BOOL hideTopLine; ///< 是否隐藏顶部线条

@end
