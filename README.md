# FSActionSheet
模仿微信底部ActionSheet, 支持横屏显示.(支持iOS6及往后版本)<p>
按钮如果过多则默认显示为屏幕高度的默认比例, 然后按钮支持滑动, 否则不支持滑动按钮.

#### 环境要求:

* iOS 6 +
* Xcode 9 +

#### 支持使用cocoapods引入:

```swif
pod 'FSActionSheet'
```

#### 各种样式效果图:

![Example screenshot](https://raw.githubusercontent.com/lifution/TestImages/master/FSActionSheetShot/ScreenShot.jpg)

#### 使用示例:

```objc
// 类UIActionSheet初始化绑定代理和设置标题
- (void)show {
	FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:@"这是ActionSheet的标题" delegate:self cancelButtonTitle:@"关闭" highlightedButtonTitle:@"删除" otherButtonTitles:@[@"拍照", @"从相册选取"]];
	// show
	[actionSheet show];
}
// FSActionSheetDelegate
- (void)FSActionSheet:(FSActionSheet *)actionSheet selectedIndex:(NSInteger)selectedIndex {
    NSLog(@"选择了第[%zi]项", selectedIndex);
}

// 自己组装item设定为actionSheet的按钮
- (void)show {
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
```

# LICENSE

FSActionSheet 基于 MIT 协议开源. 更多开源信息请查看 LICENSE 文件.