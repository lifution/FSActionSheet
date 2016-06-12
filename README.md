# FSActionSheet
模仿微信底部ActionSheet, 支持横屏显示.<p>
按钮如果过多则默认显示为屏幕高度的默认比例, 然后按钮支持滑动, 否则不支持滑动按钮.<p>
几种效果样式如图:<p>
![Example screenshot](https://raw.githubusercontent.com/lifution/TestImages/master/FSActionSheetShot/ScreenShot.jpg)<p>
<P>
```Objective-C
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
		FSActionSheetItem *item = actionSheetItems[selectedIndex];		_label.text = item.title;
	}];
}

```