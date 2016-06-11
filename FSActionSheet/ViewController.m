//
//  ViewController.m
//  FSActionSheet
//
//  Created by Steven on 16/5/11.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "ViewController.h"
#import "FSActionSheet.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSString *actionSheetTitle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if ([UIScreen mainScreen].scale == 3) {
        _imageView.image = [UIImage imageNamed:@"background_image@3x.jpg"];
    } else {
        _imageView.image = [UIImage imageNamed:@"background_image@2x.jpg"];
    }
    _tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = UIView.new;
    _tableView.separatorColor = [UIColor whiteColor];
    
    _actionSheetTitle = @"这是一个模仿微信底部ActionSheet风格的ActionSheet, 如果你对FSActionSheet有更好的建议或者发现Bug的话可以在Github上issue, 也可以直接联系我QQ: 1101344793, Thx.";
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
        cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"单文本居中";
            break;
        case 1:
            cell.textLabel.text = @"单文本居中带标题";
            break;
        case 2:
            cell.textLabel.text = @"单文本带标题内容偏左";
            break;
        case 3:
            cell.textLabel.text = @"单文本带标题内容偏右";
            break;
        case 4:
            cell.textLabel.text = @"附带icon居中";
            break;
        case 5:
            cell.textLabel.text = @"附带icon居中带标题";
            break;
        case 6:
            cell.textLabel.text = @"附带icon内容偏左";
            break;
        default:
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _label.text = @"弹窗选择回调会显示在这里";
    switch (indexPath.row) {
        case 0:
            [self justText];
            break;
        case 1:
            [self textWithTitleInCenter];
            break;
        case 2:
            [self textWithTitleInLeft];
            break;
        case 3:
            [self textWithTitleInRight];
            break;
        case 4:
            [self textWithIconInCenter];
            break;
        case 5:
            [self textWithIconAndTitleInCenter];
            break;
        case 6:
            [self textWithIconInLeft];
            break;
        default:
            break;
    }
}


#pragma mark - 各种调用效果
// 单文本居中
- (void)justText {
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"拍照"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"从相册选取"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeHighlighted, @"删除")]
                                        mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:nil cancelTitle:nil items:actionSheetItems];
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        FSActionSheetItem *item = actionSheetItems[selectedIndex];
        _label.text = item.title;
    }];
}

// 单文本居中带标题
- (void)textWithTitleInCenter {
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"拍照"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"从相册选取"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeHighlighted, @"删除")]
                                        mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:_actionSheetTitle cancelTitle:nil items:actionSheetItems];
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        FSActionSheetItem *item = actionSheetItems[selectedIndex];
        _label.text = item.title;
    }];
}

// 单文本带标题内容偏左
- (void)textWithTitleInLeft {
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"拍照"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"从相册选取"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeHighlighted, @"删除")]
                                        mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:_actionSheetTitle cancelTitle:nil items:actionSheetItems];
    actionSheet.contentAlignment = FSContentAlignmentLeft;
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        FSActionSheetItem *item = actionSheetItems[selectedIndex];
        _label.text = item.title;
    }];
}

// 单文本带标题内容偏右
- (void)textWithTitleInRight {
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"拍照"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeNormal, @"从相册选取"),
                                          FSActionSheetTitleItemMake(FSActionSheetTypeHighlighted, @"删除")]
                                        mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:_actionSheetTitle cancelTitle:nil items:actionSheetItems];
    actionSheet.contentAlignment = FSContentAlignmentRight;
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        FSActionSheetItem *item = actionSheetItems[selectedIndex];
        _label.text = item.title;
    }];
}

// 附带icon居中
- (void)textWithIconInCenter {
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@"camera"], @"拍照"),
                                          FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@"album"], @"从相册选取"),
                                          FSActionSheetTitleWithImageItemMake(FSActionSheetTypeHighlighted, [UIImage imageNamed:@"delete"], @"删除")]
                                        mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:nil cancelTitle:@"关闭" items:actionSheetItems];
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        FSActionSheetItem *item = actionSheetItems[selectedIndex];
        _label.text = item.title;
    }];
}

// 附带icon居中带标题
- (void)textWithIconAndTitleInCenter {
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@"camera"], @"拍照"),
                                          FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@"album"], @"从相册选取"),
                                          FSActionSheetTitleWithImageItemMake(FSActionSheetTypeHighlighted, [UIImage imageNamed:@"delete"], @"删除")]
                                        mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:_actionSheetTitle cancelTitle:@"关闭" items:actionSheetItems];
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        FSActionSheetItem *item = actionSheetItems[selectedIndex];
        _label.text = item.title;
    }];
}

// 附带icon内容偏左
- (void)textWithIconInLeft {
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@"camera"], @"拍照"),
                                          FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@"album"], @"从相册选取"),
                                          FSActionSheetTitleWithImageItemMake(FSActionSheetTypeHighlighted, [UIImage imageNamed:@"delete"], @"删除")]
                                        mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:nil cancelTitle:@"关闭" items:actionSheetItems];
    actionSheet.contentAlignment = FSContentAlignmentLeft;
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        FSActionSheetItem *item = actionSheetItems[selectedIndex];
        _label.text = item.title;
    }];
}


@end











