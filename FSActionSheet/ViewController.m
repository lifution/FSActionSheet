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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showFSActionSheetWithoutImage {
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

- (void)showFSActionSheetWithImage {
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@"camera"], @"拍照"),
                                          FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@"album"], @"从相册选取"),
                                          FSActionSheetTitleWithImageItemMake(FSActionSheetTypeHighlighted, [UIImage imageNamed:@"delete"], @"删除")]
                                        mutableCopy];
    NSString *title = @"这是一个模仿微信底部ActionSheet风格的ActionSheet, 如果你觉得有更好的 创意||功能 要添加上FSActionSheet的可以在Github上issue, 也可以直接联系我QQ: 1101344793, Thx.";
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:title cancelTitle:nil items:actionSheetItems];
    actionSheet.contentAlignment = FSContentAlignmentLeft;
    // 展示并绑定选择回调
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex) {
        FSActionSheetItem *item = actionSheetItems[selectedIndex];
        _label.text = item.title;
    }];
}




#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
            cell.textLabel.text = @"正常居中的ActionSheet";
            break;
        case 1:
            cell.textLabel.text = @"附带icon且内容靠左的ActionSheet";
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
            [self showFSActionSheetWithoutImage];
            break;
        case 1:
            [self showFSActionSheetWithImage];
            break;
        default:
            break;
    }
}

@end











